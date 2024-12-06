FROM openjdk:17-jdk-slim

# Sao chép file JAR vào container
COPY target/WebMakeupConnection-0.0.1-SNAPSHOT.jar app.jar

# Cài đặt wait-for-it script để kiểm tra MySQL khởi động
RUN apt-get update && apt-get install -y curl && \
    curl -o /wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x /wait-for-it.sh

# Expose cổng 8080
EXPOSE 8080

# Chạy ứng dụng Spring Boot sau khi MySQL sẵn sàng
ENTRYPOINT ["/wait-for-it.sh", "mysql-db:3306", "--", "java", "-jar", "/app.jar"]
