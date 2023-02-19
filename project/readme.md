# Final project 
## Personal business card website development CI/CD  

### Presentation 
- [Google slides](https://docs.google.com/presentation/d/e/2PACX-1vQ1CLY_mlVwF7t53XNbO9k4x7KxBu8flZYvmjOckAu1gkwj-MR4qOvb9bs07m2fjE06TbszMheMR5gZ/pub?start=false&loop=false) 
- [pdf](final-project.pdf)


#### Project description

####
- local git, terraform
- AWS cloud [provider](/terraform-aws/provider.tf)
- 3 nodes 
    - [jenkins](/aws/ansible/playbooks/jenkins.yaml), [ansible](/aws/ansible/)
    - [stage](/aws/ansible/hosts)
    - [production](/aws/ansible/hosts)


### Terraform init infrastructure 
![terraform](pictures/1.terraform.png)

### Configure Jenkins for CI/CD 
![jenkins](pictures/2.jenkins.png)

### Stage server before changes 
![stage](pictures/3.stage.png)

### Push changes to stage branch
![stage-branch](pictures/4.stage-branch.png)

### Jenkins job after changes 
![jenkins](pictures/5.jenkins.png)

### Stage server after changes 
![stage](pictures/6.stage.png)

### Prod before jenkins deploy
![prod](/project/pictures/0.1.prod.png)

### Merge stage branch to master 
![stage](pictures/7.merge.png)

### Jenkins job triggered by github webhook
![stage](pictures/8.trigger.png)

### Results on the prod server
![prod](pictures/0.prod.png)

### Backup at Oracle Cloud Infrastructure
[stage](http://140.238.218.134/)

[prod](http://140.238.218.75/)

