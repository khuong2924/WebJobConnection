# Job Connection System

## Overview

This project is a **Job Connection System** designed specifically for the makeup industry, aiming to solve core issues related to managing and operating job connection processes. The system provides detailed role management for various user groups such as customers, service providers, and platform staff. Key functionalities include:

- **Job Posting & Application**: Enables customers to post job openings and service providers to apply.
- **Appointment Management**: Allows users to schedule and manage appointments with ease.
- **Job Classification**: Helps in categorizing job opportunities based on different criteria.
- **Community Content Control**: Manages and monitors user-generated content on the platform.

By automating these processes, the system reduces manual intervention and enhances operational efficiency.

Moreover, the platform integrates essential business modules to drive growth:

- **Online Payments**: Integrated with **PayPal Sanbox** for seamless payment processing.
- **Service Ratings**: Allows customers to rate services, ensuring quality and customer satisfaction.
- **Promotional Collaborations**: Supports partnerships with brands for cross-promotion.
- **Upgraded Service Packages**: Offers premium services to generate sustainable revenue streams.

This system is not just a job connection platform; it's a comprehensive **management tool** that provides long-term value and effectiveness for customers, makeup service providers, and platform owners.

## Project Journey

Initially, I felt confident in planning this project because of my strong familiarity with **Spring Boot**. Everything went smoothly at first as I followed tutorials and quickly built out both the front-end and back-end. However, I decided to push my limits and integrate **Sandbox PayPal** for payment processing, which added an extra challenge to the project.

Additionally, I gained hands-on experience in **responsive web design** using **pure HTML** and **Bootstrap**. Although I was more comfortable working with **React** and **TailwindCSS**, this project gave me the opportunity to expand my skills and step out of my comfort zone.

This was the project I developed the most independently, as the tutorials I followed only covered the basics. As a result, it became the longest and most challenging project I’ve worked on, but also the most rewarding.

## 💻 Technologies Used

- **Spring**: Framework for building and securing the application.
- **Thymeleaf**: Server-side template engine for rendering HTML views.
- **Bootstrap**: CSS framework for responsive, mobile-first web design.
- **Hibernate**: ORM framework for efficient database operations.
- **JWT**: Token-based authentication and authorization.
- **PayPal Sanbox**: Payment processing integration.
- **Docker**: Containerization for consistent and reproducible environments.

## 🚀 Features

- **Custom User Roles**: Different permissions for customers, service providers, and platform staff.
- **Job Management**: Easy posting, application, and management of makeup jobs.
- **Responsive Design**: Fully responsive interface, optimized for various devices.
- **Secure Payments**: Integration with **Sandbox PayPal** for smooth transactions.
- **Business Growth Modules**: Service ratings, promotions, and premium service packages.

## 📦 Setup & Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
   ```bash
      git clone https://github.com/khuong2924/WebJobConnection

2. **Set Up Environment Variables**

```env
   DB_USERNAME=your_db_username
   DB_PASSWORD=your_db_password
   DB_URL=your_db_url/e-commerce
   
   PAYPAL_SECRET_KEY=your_PayPal Sanbox_secret_key
   
   CLOUDINARY_CLOUD_NAME=your_cloudinary_cloud_name
   CLOUDINARY_API_KEY=your_cloudinary_api_key
   CLOUDINARY_API_SECRET=your_cloudinary_api_secret
   Some useful resources to get the environment variables:
   MySQL
   PayPal Sandbox
   JWT secret
   Cloudinary
```
## 🐳 Running the Project with Docker

Follow these steps to run the project using Docker:

### 1. **Ensure Docker is Installed**

Make sure Docker is installed and running on your system. If you don’t have Docker installed, download and install it from [Docker's official website](https://www.docker.com/).

### 2. **Build the Docker Image**

Navigate to the project directory (where your `Dockerfile` is located) and build the Docker image using the following command:

```bash
docker build -t webjobconnection:latest .

docker run -d -p <host_port>:<container_port> --name <container_name> <image_name>:<tag>

docker run -d -p 3000:8080 --name webjob-container webjobconnection:latest

docker ps

docker-compose up -d

docker-compose down
```







