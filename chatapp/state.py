import reflex as rx
import asyncio
import apikey
import os
from openai import AsyncOpenAI
class State(rx.State):
  # The current question being asked.
    question: str
    # Update user question:
    def user_question(self,user_input):
        self.question = user_input
        print(self.question)
    # Keep track of the chat history as a list of (question, answer) tuples.
    chat_history: list[tuple[str, str]]

    async def answer(self):
      client = AsyncOpenAI(api_key=apikey.OPENAI_API_KEY)
      session = await client.chat.completions.create(
          model="gpt-3.5-turbo",
          messages=[
              {"role": "user", "content": self.question}
          ],
          stop=None,
          temperature=0.7,
          stream=True,
      )
      # Add to the answer as the chatbot responds.
      answer = ""
      self.chat_history.append((self.question, answer))
      # Clear the question input.
      self.question = ""
      yield
      async for item in session:
        if hasattr(item.choices[0].delta, "content"):
            if item.choices[0].delta.content is None:
                # presence of 'None' indicates the end of the response
                break
            answer += item.choices[0].delta.content
            self.chat_history[-1] = (self.chat_history[-1][0], answer)
            yield
