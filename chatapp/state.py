import reflex as rx
import asyncio

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
        # Our chatbot is not very smart right now...
        answer = "bot: idk"
        self.chat_history.append(("bob"+self.question, ""))
        self.question = ""
        yield
        for i in range(len(answer)):
        # Pause to show the streaming effect.
            await asyncio.sleep(1.1)
         # Add one letter at a time to the output.
            self.chat_history[-1] = (
                self.chat_history[-1][0],
                answer[: i + 1],
            )
            yield
