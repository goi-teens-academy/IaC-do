resource "digitalocean_app" "mono-repo-example" {
  spec {
    name   = "mono-repo-example"
    region = "ams"
    domain {
      name = "foo.example.com"
    }

    alert {
      rule = "DEPLOYMENT_FAILED"
    }

    # Build a Go project in the api/ directory that listens on port 3000
    # and serves it at https://foo.example.com/api
    service {
      name               = "api"
      environment_slug   = "go"
      instance_count     = 2
      instance_size_slug = "professional-xs"

      github {
        branch         = "main"
        deploy_on_push = true
        repo           = "username/repo"
      }

      source_dir = "api/"
      http_port  = 3000

      routes {
        path = "/api"
      }

      alert {
        value    = 75
        operator = "GREATER_THAN"
        window   = "TEN_MINUTES"
        rule     = "CPU_UTILIZATION"
      }

      log_destination {
        name = "MyLogs"
        papertrail {
          endpoint = "syslog+tls://example.com:12345"
        }
      }

      run_command = "bin/api"
    }

    # Builds a static site in the project's root directory
    # and serves it at https://foo.example.com/
    static_site {
      name          = "web"
      build_command = "npm run build"

      github {
        branch         = "main"
        deploy_on_push = true
        repo           = "username/repo"
      }

      routes {
        path = "/"
      }
    }

    database {
      name       = "starter-db"
      engine     = "PG"
      production = false
    }
  }
}
