# -------- Service config --------
service_name   = "sample-app"
container_name = "sample-app"
container_port = 3000

cpu    = "256"
memory = "512"

image_tag         = "latest"
health_check_path = "/health"
desired_count     = 1

# -------- ALB routing --------
listener_priority = 100
path_patterns     = ["/sample/*"]

# -------- Logging --------
log_retention_in_days = 14

# -------- Stage 1 outputs (YOUR REAL VALUES) --------
vpc_id = "vpc-0344040b386a69bd6"

private_subnet_ids = [
  "subnet-0b36b6e175ce36a9f",
  "subnet-06cd848f63ae91593"
]

alb_security_group_id = "sg-0a443ba94e6f8562b"

http_listener_arn = "arn:aws:elasticloadbalancing:us-east-1:306616136846:listener/app/nikhil-alb/a826113108cb7e99/cb2c6eecd408c94d"

ecs_cluster_arn = "arn:aws:ecs:us-east-1:306616136846:cluster/nikhil-main-cluster"

# -------- IAM roles --------
execution_role_arn = "arn:aws:iam::306616136846:role/ecsTaskExecutionRole"
task_role_arn      = "arn:aws:iam::306616136846:role/sample-task-role"

# -------- Region --------
aws_region = "us-east-1"