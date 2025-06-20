### alb/outputs.tf
output "alb_dns" {
  value = aws_lb.this.dns_name
}
output "target_group_name" {
  value = aws_lb_target_group.this.name
}