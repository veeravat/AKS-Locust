from locust import HttpUser, task, between
from locust.contrib.fasthttp import FastHttpUser
import resource
resource.setrlimit(resource.RLIMIT_NOFILE, (999999, 999999))

class MyUser(FastHttpUser):
    wait_time = between(1, 5)

    @task
    def index(self):
        self.client.get("/")

