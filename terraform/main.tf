# dev infra  -- 2 EC2 - 1 S3 1-dynamoDB
module "dev-infra" {
    source = "./infra"
    env= "dev"
    instance_count= 1
    instance_type= "t3.micro"
    ami="ami-02d26659fd82cf299"
    volume_size=10
}
#stag infra  -- 2 EC2 - 1 S3 1-dynamoDB
module "staging-infra" {
    source = "./infra"
    env= "staging"
    instance_count= 1
    instance_type= "t3.micro"
    ami= "ami-02d26659fd82cf299"
    volume_size= 8
}

#prod infra  -- 3 EC2 - 1 S3 1-dynamoDB
module "Prod-infra" {
    source = "./infra"
    env= "prod"
    instance_count= 1
    instance_type= "t3.micro"
    ami= "ami-02d26659fd82cf299"
    volume_size= 8
}

output "dev_infra_ec2_instance_public_ips" {
    value = module.dev_infra.ec2_public_ip
}

output "staging_infra_ec2_instance_public_ips" {
    value = module.staging_infra.ec2_public_ip
}
~                     
