# IaC-do
infrastructure as code Digital Ocean v.1
Перед запуском цього скрипту необхідно мати встановлений Terraform і замінити YOUR_API_TOKEN на свій власний токен доступу API DigitalOcean.

Збережіть цей файл як main.tf, потім виконайте команди:

Ініціалізуйте Terraform:
terraform init
Перегляньте план створення сервера Redis:

terraform plan
Застосуйте зміни і створіть сервер Redis:

terraform apply
Terraform автоматично створить сервер на DigitalOcean, використовуючи вказані параметри. Після успішного виконання ви побачите повідомлення з деталями про створений сервер .

Будьте уважні при використанні Terraform, оскільки він впливає на вашу інфраструктуру в хмарі. Переконайтеся, що розумієте наслідки своїх дій перед виконанням команд.




