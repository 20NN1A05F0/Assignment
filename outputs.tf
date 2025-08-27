output "jenkins_master_public_ip" {
  value = aws_instance.jenkins_master.public_ip
}
output "app_node_public_ip" {
  value = aws_instance.app_node.public_ip
}
