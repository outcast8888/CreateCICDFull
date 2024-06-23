resource "aws_sqs_queue" "main" {
  name = var.queue_name
}

output "queue_url" {
  value = aws_sqs_queue.main.id
}

output "queue_arn" {
  value = aws_sqs_queue.main.arn
}
