using UnityEngine;
using UnityEngine.UI;

public class UIBindingsExample : MonoBehaviour {

	[SerializeField]
	private Button shareButton;
	
	[SerializeField]
	private Button reviewButton;

	// Use this for initialization
	void Start () {
		shareButton.onClick.AddListener(ShowShare);
		reviewButton.onClick.AddListener(ShowReview);
	}

	void ShowShare(){NativeAssets.Share("Hey! I want to share this with you", "https//:google.com");}
	void ShowReview(){NativeAssets.Review();}
}
