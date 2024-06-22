# PrivateLLMs
 
you like **_ollama_**, and **_llama.cpp_**, you love PrivateLLMs decentralized (local) llms to run in your computer privately, and host ALL your AI locally. 

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
      to check if the ollama works in your computer, open your chrome browser, and type in the search bar: `localhost:11434`
      it should be showed like this: ![image](https://github.com/Esmail-ibraheem/Private-llms/assets/113830751/b11a796e-9b4d-4ef6-966f-9512199ce6b3)
