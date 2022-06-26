<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
 
  <h3 align="center">Asp Challenge</h3>

  <p align="center">
    A terraform project to deploy a static website on AWS S3 bucket! 
    The autentication to the site is done by lamda functions and the cdn service by AWS Cloudfront. 
    <br />
    <a href="https://learn.hashicorp.com/collections/terraform/aws-get-started"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    ·
    <a href="mailto: juansmartinez21@outlook.es">Report Bug</a>
    ·
    <a href="https://www.linkedin.com/in/juansebastianmartinezcaldas/">Any doubt? Contact me</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot]]

This is a project that automatically deployes the resources needed to deploy a static website on a AWS S3 bucket. it's content is restricted to user with access. The authentication was done through a Node.JS function that runs in AWS lambda service, The CDN services through Cloudfront. A support user with programatic access is created too.

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With


* [AWS](https://aws.amazon.com/)
* [Terraform](https://www.terraform.io/)
* [S3 Bucket](https://aws.amazon.com/s3/)
* [Cloudfront](https://aws.amazon.com/cloudfront/)
* [Lambda@Edge](https://aws.amazon.com/lambda/edge/)
* [Node.JS](https://nodejs.org/en/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

Due to this project is built with terraform, there should not be problems with OS compatibily, however, you should have certain configuration in your OS as well as you aws account.

### Prerequisites

* you must have terraform installed.
* you must have a user with programatic access with the next policies.
    ```sh
        Create buckets
        Upload Content to Bukets
        Create Lambda functions
        Update Lambda functions
        Create Cloudfront distributions
        Update Cloudfront distributions
        SSM Access
        Create users        
    ```

### Installation


1. Clone the repo
2. Create a new file in the root name: terraform.tfvars
3. Set the variables
   ```sh
   aws_access_key = "the access key of your user"
   aws_secret_key = "the access secret key of your user"
   region = "the region to provide the resources"
   s3_bucket_name = "name of the bucket"
   user = "the user to authenticate to the static web"
   ```
4. Terraform init
5. Terraform plan -var-file="terraform.tfvars"
6. Terraform apply -var-file="terraform.tfvars" 

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

If you run in a succesfull way, you are going to get a cloudfront url, one time you access you will be able to see the index.html file.



<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->

<!-- CONTACT -->
## Contact

Juan Sebastian Martinez - [@juansmartinez21](https://www.linkedin.com/in/juansebastianmartinezcaldas/) - email@example.com

Project Link: [https://github.com/juansmartinez21/asp_challenge.git](https://github.com/juansmartinez21/asp_challenge.git)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments



<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
