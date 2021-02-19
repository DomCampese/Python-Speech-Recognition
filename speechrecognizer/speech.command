#!/usr/bin/env python

import speech_recognition as sr
import tkinter as tk

class Application(tk.Frame):

    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()
    
    def create_widgets(self):
        self.listen_button = tk.Button(self)
        self.listen_button["text"] = "Click me and I'll listen!"
        self.listen_button["command"] = self.recognize_speech
        self.clear_button = tk.Button(self)
        self.clear_button["text"] = "Clear"
        self.clear_button["command"] = self.clear_text
        self.text_widget = tk.Text(self, font="Arial 15", height=16, width=80)
        self.text_widget.yview_scroll(3, "pages")
        self.text_widget.pack(side="top", fill="x")
        self.clear_button.pack(side="bottom")
        self.listen_button.pack(side="bottom")
        
    def recognize_speech(self):
        r = sr.Recognizer()
        with sr.Microphone() as source:
            audio = r.listen(source)
            try:
                text = r.recognize_google(audio)
                self.text_widget.insert(tk.END, text)
            except:
                self.text_widget.insert(tk.END, "Something went wrong.")
    
    def clear_text(self):
        self.text_widget.delete("1.0", "end")

def center(root):
    windowWidth = root.winfo_reqwidth()
    windowHeight = root.winfo_reqheight()
    positionRight = int((root.winfo_screenwidth()/2 - windowWidth/2)-120)
    positionDown = int((root.winfo_screenheight()/2 - windowHeight/2)-60)
    root.geometry("+{}+{}".format(positionRight, positionDown))

def main():
    root = tk.Tk()
    app = Application(master=root)
    root.geometry("550x350")
    root.title("Speech Recognizer")
    center(root)
    app.mainloop()
    
if __name__ == "__main__":
    main()








