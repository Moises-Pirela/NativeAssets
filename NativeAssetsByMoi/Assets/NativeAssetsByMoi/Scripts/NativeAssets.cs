using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

public class NativeAssets : MonoBehaviour 
{
	[DllImport("__Internal")]
	private static extern void _ShareMessage(string message, string url);

	[DllImport("__Internal")]
	private static extern void _ShowReview();

	public static void Share(string message, string url)
	{
		_ShareMessage(message, url);
	}

	public static void Review()
	{
		_ShowReview();
	}
}
