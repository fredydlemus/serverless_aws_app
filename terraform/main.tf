module "orders_table" {
    source = "./modules/dynamodb"
    name                    = "orders"
    partition_key          = "order_id"
    billing_mode           = "PAY_PER_REQUEST"
    point_in_time_recovery = true
    server_side_encryption = true
    
    environment = terraform.workspace
    project     = var.project
    owner       = var.owner
}