import multiprocessing
import time

def task1():
    while True:
        print("Task 1 is running...")
        time.sleep(1)

def task2():
    while True:
        print("Task 2 is running...")
        time.sleep(2)

if __name__ == "__main__":
    # Create two processes to run the tasks in the background
    p1 = multiprocessing.Process(target=task1)
    p1.start()

    p2 = multiprocessing.Process(target=task2)
    # Start the processes
    p2.start()

    # Wait for the processes to finish (which is never in this case)
    # p1.join()
    # p2.join()