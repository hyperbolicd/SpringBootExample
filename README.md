# SpringBootExample

## Run locally
Update data source information and frontend url(cors_origin) in `src/main/resources/application.properties` or set the corresponding environment variables.

```
./mvnw package && java -jar target/springboot-backend-0.0.1-SNAPSHOT.jar
```

## Use GitHub Actions to deploy to S3 and CloudFront

### Pre-request
1. Create RDS, EC2, S3
2. Create an IAM user with the necessary permissions to access EC2 and S3. For testing purposes, you can assign full access permissions temporarily. Once the user is created, generate an access key for programmatic access.
3. SSH to EC2
* Set corresponding environment variables in EC2, see `src/main/resources/application.properties`.
* cd `/home/ec2-user`
* Copy shell script from repo path `aws/scripts/*` to EC2:`/home/ec2-user`
* `chmod a+x *.sh`
* `sudo su -` and `aws configure`

### Actions secrets and variables
|Type|Key|Note|
|---|---|---|
|Variable|`JAVA_DISTRIBUTION`|ex. `adopt-openj9`|
|Variable|`JAVA_VERSION`||
|Secret|`AWS_ACCESS_KEY_ID`|IAM user|
|Secret|`AWS_SECRET_ACCESS_KEY`|IAM user|
|Secret|`AWS_REGION`||
|Secret|`AWS_EC2_INSTANCE_ID`|EC2|
|Secret|`AWS_S3_BUCKET_NAME`|S3|
