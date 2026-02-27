# --- NAT Gateway (for private subnet outbound internet) ---

resource "aws_eip" "nat" {
  domain = "vpc"
  tags   = merge(local.tags, { Name = "${var.project_name}-nat-eip" })
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id # NAT must live in a PUBLIC subnet

  depends_on = [aws_internet_gateway.this]

  tags = merge(local.tags, { Name = "${var.project_name}-nat" })
}

# Route private subnets' default traffic to the NAT (outbound-only internet)
resource "aws_route" "private_default_via_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}