import time
from queue import Queue
import threading
import json
import cv2
from matplotlib import pyplot as plt
from segment_anything import SamPredictor, sam_model_registry
import numpy as np

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

            self.message["data"] = "hello from python"
            message_json = json.dumps(self.message)
            queue.put(message_json)
            time.sleep(1)

def test_segmentation() -> None:
    # Load the image
    sam = sam_model_registry["vit_h"](checkpoint="src_vision/sam_vit_h_4b8939.pth")
    predictor = SamPredictor(sam)

    img = cv2.imread("src_vision/images/test.jpg")
    # Get the dimensions of the image
    height, width = img.shape[:2]

    input_point = np.array([[width // 2, height // 2]])
    input_label = np.array([1])

    predictor.set_image(img)
    masks, scores, _ = predictor.predict(input_point, input_label)

    masked_image = img.copy()
    mask = masks[0]
    
    # Create a mask where non-masked pixels are set to zero
    masked_image[mask == 0] = 0

    # Display the masked image
    cv2.imshow(f"Masked Image", masked_image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

def show_mask(mask, ax, random_color=False):
    if random_color:
        color = np.concatenate([np.random.random(3), np.array([0.6])], axis=0)
    else:
        color = np.array([30/255, 144/255, 255/255, 0.6])
    h, w = mask.shape[-2:]
    mask_image = mask.reshape(h, w, 1) * color.reshape(1, 1, -1)
    ax.imshow(mask_image)
    
def show_points(coords, labels, ax, marker_size=375):
    pos_points = coords[labels==1]
    neg_points = coords[labels==0]
    ax.scatter(pos_points[:, 0], pos_points[:, 1], color='green', marker='*', s=marker_size, edgecolor='white', linewidth=1.25)
    ax.scatter(neg_points[:, 0], neg_points[:, 1], color='red', marker='*', s=marker_size, edgecolor='white', linewidth=1.25)   
    

if __name__ == "__main__":
    test_segmentation()

