

resource "aws_instance" "roboshop" {
    for_each = var.instances # this variable is map
    # for_each will give us a special variable with name each
    ami = data.aws_ami.joindevops.id
    instance_type = each.value
    vpc_security_group_ids = [var.allow_all]
    tags = {
        Name = each.key
    }
}

resource "aws_route53_record" "expense" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  #backend.daws81s.online
  name            = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}