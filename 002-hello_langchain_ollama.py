from langchain_community.llms import Ollama

def main() -> None:

    # Define the model name
    model = "llama3"

    # Initialise the model
    llm = Ollama(model=model)

    # Define the prompt
    prompt = "how can langsmith help with testing?"
    
    # Invoke with a prompt, response as a whole.
    print(f"Invoking prompt: '{prompt}' ...")
    response = llm.invoke(prompt)
    print(response)

    # Incoke the prompt, response as a stream.abs
    chunks = []
    print(f"Streaming response for prompt: '{prompt}' ...")
    for chunk in llm.stream(prompt):
        chunks.append(chunk)
        print(chunk, end="", flush=False)


if __name__ == "__main__":
    main()
