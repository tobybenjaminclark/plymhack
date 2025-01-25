import time
from queue import Queue
import threading
import json
import cv2


class CVHandler():
    stop_event: threading.Event      # Event to signal the termination of the thread.
    message_queue: Queue             # Queue to transfer data from the subthread to the main thread.
    thread: threading.Thread         # Thread to continously retrieve gestures from webcam input.

    def __init__(self):
        """
        Initialise the stop event and gesture queue.
        """
        self.message_queue = Queue()
        self.message = {}
        

    def start_thread(self) -> None:
        """
        Create and start the computer vision thread.
        """
        self.create_thread()
        
    def create_thread(self) -> threading.Thread:
        """
        Create the computer vision thread.
        """

        self.thread: threading.Thread
        self.thread = threading.Thread(
            target=self.send_messages, args=(self.message_queue,)
        )
        self.thread.start()

    def send_messages(self, queue) -> None:

        self.test_segmentation()

        
        while True:

            """
            self.message["data"] = "hello from python"
            message_json = json.dumps(self.message)
            queue.put(message_json)
            """
            time.sleep(1)

    def test_segmentation(self) -> None :

        # Load the image
        image = cv2.imread('images/test.jpg')

        if image is None:
            print("Error: Image not found or unable to load!")
        else:
            cv2.imshow('Image', image)

            cv2.waitKey(0)
            cv2.destroyAllWindows()