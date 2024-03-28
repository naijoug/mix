import time
import threading

class Task1:
    def run(self):
        while True:
            print("Task 1 is running...")
            time.sleep(1)

class Task2:
    def run(self):
        while True:
            print("Task 2 is running...")
            time.sleep(2)

if __name__ == "__main__":
    # Create instances of the tasks
    task1 = Task1()
    task2 = Task2()

    # Start the tasks as separate threads
    thread1 = threading.Thread(target=task1.run)
    thread1.start()
    
    thread2 = threading.Thread(target=task2.run)
    thread2.start()

    # Wait for the threads to finish (which is never in this case)
    # thread1.join()
    # thread2.join()
