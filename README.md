# PrivateLLMs
 
you like **_ollama_**, and **_llama.cpp_**, you love PrivateLLMs decentralized (local) llms to run in your computer privately and host ALL your AI locally. 

## 1- Building Decentralized LLMs Computer:
  - first download [Ollama](https://ollama.com/download/) on your computer:
      - choose the OS version you want to download:\
             **`For Windows`** just click on [download (the preview)](https://ollama.com/download/OllamaSetup.exe)
     
          **`For Linux`** write this command in your terminal:
           in my case I am using wsl in Windows so, I can use the Linux command in the Windows terminal: 
        ```
        curl -fsSL https://ollama.com/install.sh | sh
        ```
        
         
           **`For MacOS`**, click on [download](https://ollama.com/download/Ollama-darwin.zip) 

    - then after downloading the Ollama, run one of the following commands in your terminal, depending on the LLM you want:
      ```
      ollama pull llama3
      ```
      ```
      ollama pull Mistral
      ```
      then run the model to check it out:
      ```
      ollama run llama3
      ```
      to check if the ollama works in your computer, open your Chrome browser, and type in the search bar: `localhost:11434`
      it should be shown like this: `Ollama is running`

  - Second connect the llama3 to a web GUI:
     - first download the docker, by typing the following commands:\
       **INSTALL DOCKER**
       ```
       # Add Docker's official GPG key:
       sudo apt-get update
       sudo apt-get install ca-certificates curl
       sudo install -m 0755 -d /etc/apt/keyrings
       sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
       sudo chmod a+r /etc/apt/keyrings/docker.asc
       
       # Add the repository to Apt sources:
       echo \
       "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
       $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
       sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
       sudo apt-get update
       ```
       ```
       sudo apt install docker.io
       ```
       or
       ```
       #Install Dockersudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
       ```

       **RUN OPEN WEBUI DOCKER CONTAINER**
       ```
       sudo docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
       ```
       **`RUN THE WEBUI WTH LLAMA BY TYPING IN THE SEARCH BAR LOCALHOST:8080`**

       ### Installing Open WebUI with Bundled Ollama Support
       This installation method uses a single container image that bundles Open WebUI with Ollama, allowing for a streamlined setup via a single command. Choose the appropriate command based on your hardware setup:
       - **`With GPU Support:`** Utilize GPU resources by running the following command:
       ```
       docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
       ```
       - **`For CPU Only:`** If you're not using a GPU, use this command instead:
       ```
       docker run -d -p 3000:8080 -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
       ```
    - second, now open the `localhost:8080` or `localhost:3000`, then choose the model you want to chat with. \
      now you should be able to chat with forexample llama3 with  a GUI locally in your computer.
