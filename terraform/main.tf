# dev infra  -- 2 EC2 - 1 S3 1-dynamoDB
module "dev-infra" {
    source = "./My_infra"
    env= "dev"
    instance_count=2
    instance_type= "t3.micro"
    ami="ami-02d26659fd82cf299"
    volume_size=10
}
#stag infra  -- 2 EC2 - 1 S3 1-dynamoDB
module "staging-infra" {
    source = ./My_infra"
    env= "staging"
    instance_count=2
    instance_type="t3.micro"
    ami="ami-02d26659fd82cf299"
    volume_size= 8
}

#prod infra  -- 3 EC2 - 1 S3 1-dynamoDB
module "Prod-infra" {
    source = ./My_infra"
    env= "Prod"
    instance_count=3
    instance_type="t3.micro"
    ami="ami-02d26659fd82cf299"
    volume_size= 8
}

output "dev_infra_ec2_instance_public_ips" {
    value = module.dev_infra.ec2_public_ip
}

output "staging_infra_ec2_instance_public_ips" {
    value = module.staging_infra.ec2_public_ip
}

