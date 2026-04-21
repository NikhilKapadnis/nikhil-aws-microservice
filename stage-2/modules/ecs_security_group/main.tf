resource "aws_security_group" "this" {
  name        = "${var.service_name}-ecs-sg"
  description = "Allow traffic from ALB to ECS service"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.container_port
    to_port         = var.container_port
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.service_name}-ecs-sg"
  }
}

# what this is doing is it is creating one SG per serviceand allows traffic only from ALB sG and to service container port