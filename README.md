# LLMs server🔒
 
you like **_ollama_**, and **_llama.cpp_**, you love LLMs Server decentralized (local) llms to run in your computer privately and host ALL your AI locally. 
<p align="center">
  <img src="https://github.com/Esmail-ibraheem/Private-llms/blob/main/llms.drawio.png" alt="Your Image Description" >
</p>


## 1- Building Decentralized LLMs Server (Software):
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
      

  - Second connect the llama3(llama-3-8.0B) to a web GUI:
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
      now you should be able to chat with for example llama3 with  a GUI locally on your computer.

      > Note: if the docker did not run in your computer after the installation, you might need to start manually from the terminal:
      ```
      sudo dockerd
      ```
      > and also for the Ollama, and it may show an error like this one: `Error: could not connect to Ollama app, is it running?`, to solve this run this command:
      ```
      ollama serve 
      ```
---

   **`Example of Docker Configuration for Open WebUI and Ollama`**
   ```yaml
    version: '3.8'
    
    services:
      ollama:
        image: ollama/ollama:latest
        container_name: ollama
        volumes:
          - ollama-data:/root/.ollama
        networks:
          - webui-network
        ports:
          - "11434:11434"
    
      webui:
        image: ghcr.io/open-webui/open-webui:latest
        container_name: open-webui
        volumes:
          - webui-data:/app/backend/data
        environment:
          - OLLAMA_BASE_URL=http://ollama:11434
        networks:
          - webui-network
        ports:
          - "8080:8080"
    
    volumes:
      ollama-data:
      webui-data:
    
    networks:
      webui-network:

   ```
**In this configuration:**

Ollama is set up to expose port 11434.
Open WebUI is configured to interact with Ollama using its internal Docker network address (http://ollama:11434).
Both services share the webui-network, allowing them to communicate securely.
Port 8080 on the host is mapped to port 8080 in the open-webui container for web access.


**to test ollama in your GPU, type in your terminal: `nvidia-smi`**


---

## 2- OmniverseLLMs-2.0 Documentation: 
- Xllama: [Xllama](https://github.com/Esmail-ibraheem/Xllama) is an advanced language model framework, inspired by the original Llama model but enhanced with additional features such as Grouped Query Attention (GQA), Multi-Head Attention (MHA), and more. This project aims to provide a flexible and extensible platform for experimenting with various attention mechanisms and building state-of-the-art natural language processing models.\

  install the requirements libraries:
    ```
    pip install requirements
    ```
    or
    ```
    pip install pytorch transformers
    ```

    clone the repo
    ```
    git clone https://github.com/Esmail-ibraheem/X-Llama.git
    ```
    run the download shell file to download the llama 2 weights
    ```
    .\download.sh
    ```
    after downloading the weights, run the inference code:
    ```
    python inference.py
    ```

---

### Citation:
```BibTex
@misc{Gumaan2024-PrivateLLMs,
  title   = "Private-llms",
  author  = "Gumaan, Esmail",
  howpublished = {\url{https://github.com/Esmail-ibraheem/Private-llms}},
  year    = "2024",
  month   = "June",
  note    = "[Online; accessed 2024-06-23]",
}
```

---

### Notes:
in this repo, I tried to simplify `how to run Ollama in your computer locally`, and use WebUI with docker to interact with llama not just from the terminal, but also interact with it in the web UI.
just follow the instructions I provided, and you should be able to use an LLM on your computer locally without an internet connection, for future reference, I will make my models and upload them here so that you can use my models just like Ollama here.
now you can access the pre-built models from Ollama depending on the model you download, but in the future, I will add my models to the webUI, and you can also chat with it from the terminal (**_I am currently working on it_**).
to read more about the WebUI, docker, and Ollama. see my article on [Medium: Build your own llms server](https://medium.com/@Esmail_A.Gumaan/build-your-own-llms-server-56e15ac26b3f).

---
