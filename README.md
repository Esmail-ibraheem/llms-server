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
      ollama run llama3
      ```
      ```
      ollama run Mistral
      ```
      to check if the ollama works in your computer, open your Chrome browser, and type in the search bar: `localhost:11434`
      it should be shown like this: `Ollama is running`

  - Second connecte the llama3 to a webGUI:
     - first download the docker, by typing the following command:
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
