# Context

I want to create an automated CI/CD pipeline.
Goal: explain me the step by step, guide me through the process

## Tech stack

For the APP:
    - Vite
    - TS
For the infra/pipeline:
    - AWS (free tier if possible):
        - Simple EC2, or suggest something else (go for simpler)
        - Allow HTTP and ssh traffic from my computer (or add something else if needed)
    - Terraform (first set-up -> infra provision)
    - GitHub (+ GitHub actions)

## Behavior/considerations

- When I merge a pull request to the main branch in my GitHub repo, I want those changes to propagate to the actual app
- In the initial set up of this pipeline I don't mind the app to be just the simple "default Vite welcome page", as I add PRs it should start to "acquire shape"
- I already have TF config files to provision an EC2 along with the SG for the inbound rules, hence, focus more in the pipeline configuration and the step by step process to wire this up
- If possible all the pipeline should operate under the "free tier" of the involved technologies