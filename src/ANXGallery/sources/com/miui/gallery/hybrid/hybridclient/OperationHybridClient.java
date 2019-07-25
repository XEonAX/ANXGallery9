package com.miui.gallery.hybrid.hybridclient;

import android.annotation.TargetApi;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build.VERSION;
import android.text.format.DateFormat;
import android.util.Base64;
import android.webkit.JavascriptInterface;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebChromeClient.FileChooserParams;
import android.webkit.WebView;
import com.miui.gallery.R;
import com.miui.gallery.activity.ExternalPhotoPageActivity;
import com.miui.gallery.hybrid.hybridclient.GalleryHybridClient.GalleryWebChromeClientWrapper;
import com.miui.gallery.hybrid.hybridclient.GalleryHybridClient.ImageCountGotCallback;
import com.miui.gallery.hybrid.hybridclient.GalleryHybridClient.ImageInfo;
import com.miui.gallery.hybrid.hybridclient.HybridClient.JsInterfacePair;
import com.miui.gallery.hybrid.hybridclient.wrapper.WebChromeClientWrapper;
import com.miui.gallery.request.HostManager;
import com.miui.gallery.scanner.MediaScanner;
import com.miui.gallery.util.BaseDocumentProviderUtils.WriteHandler;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.ToastUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class OperationHybridClient extends GalleryHybridClient {
    /* access modifiers changed from: private */
    public int mMaxSelectCount;
    /* access modifiers changed from: private */
    public ValueCallback<Uri[]> mValueCallback;

    public class OperationStoryJSBridge {
        OperationStoryJSBridge() {
        }

        @JavascriptInterface
        public boolean saveImage(String str) {
            OperationHybridClient.this.recordSaveEvent("save_click");
            if (!HostManager.isInternalUrl(OperationHybridClient.this.mCurrentUrl)) {
                return false;
            }
            ImageInfo imageInfo = (ImageInfo) GsonUtils.fromJson(str, ImageInfo.class);
            if (!(imageInfo == null || imageInfo.data == null)) {
                try {
                    byte[] decode = Base64.decode(imageInfo.data, 0);
                    final Bitmap decodeByteArray = BitmapFactory.decodeByteArray(decode, 0, decode.length);
                    if (decodeByteArray != null) {
                        Log.d("OperationHybridClient", "save image from html,image size: %d X %d", Integer.valueOf(decodeByteArray.getWidth()), Integer.valueOf(decodeByteArray.getHeight()));
                        File file = new File(StorageUtils.getCreativeDirectory(), String.format(Locale.US, "IMG_%s.jpg", new Object[]{DateFormat.format("yyyyMMdd_HHmmss", System.currentTimeMillis())}));
                        Boolean bool = (Boolean) DocumentProviderUtils.safeWriteFile(file.getAbsolutePath(), new WriteHandler<Boolean>() {
                            public Boolean handle(FileOutputStream fileOutputStream) {
                                return Boolean.valueOf(GalleryUtils.saveBitmapToOutputStream(decodeByteArray, CompressFormat.JPEG, fileOutputStream));
                            }
                        });
                        if (bool == null || !bool.booleanValue()) {
                            ToastUtils.makeText(OperationHybridClient.this.mContext, (int) R.string.main_save_error_msg);
                            Log.d("OperationHybridClient", "save image fail,bitmap compress error");
                        } else {
                            OperationHybridClient.this.callJsMethod(OperationHybridClient.this.mWebView, "javascript:onImageSaveResult()", null);
                            MediaScanner.scanSingleFile(OperationHybridClient.this.mContext, file.getPath());
                            MediaStoreUtils.insert(OperationHybridClient.this.mContext, file, 1);
                            OperationHybridClient.this.recordSaveEvent("save_success");
                            OperationHybridClient.this.gotoPhotoPage(file.getPath());
                        }
                    } else {
                        Log.d("OperationHybridClient", "save image fail,no bitmap got from web");
                    }
                    return true;
                } catch (IllegalArgumentException e) {
                    Log.e("OperationHybridClient", "saveImage() failed %s", (Object) e);
                } catch (RuntimeException e2) {
                    Log.e("OperationHybridClient", "saveImage() failed %s", (Object) e2);
                } catch (OutOfMemoryError e3) {
                    Log.e("OperationHybridClient", "saveImage %s", (Object) e3);
                } catch (Exception e4) {
                    Log.e("OperationHybridClient", "saveImage %s", (Object) e4);
                }
            }
            return false;
        }
    }

    public class OperationWebChromeClientWrapper extends GalleryWebChromeClientWrapper {
        public OperationWebChromeClientWrapper(WebChromeClient webChromeClient) {
            super(webChromeClient);
        }

        public void getFileChooserMaxImageCount(WebView webView, final ImageCountGotCallback imageCountGotCallback) {
            OperationHybridClient.this.callJsMethod(webView, "javascript:getMaxImageCount()", new ValueCallback<String>() {
                public void onReceiveValue(String str) {
                    int i;
                    Log.d("OperationHybridClient", "get max image count from html:%s", (Object) str);
                    try {
                        i = Integer.parseInt(str);
                    } catch (NumberFormatException e) {
                        Log.e("OperationHybridClient", (Throwable) e);
                        i = 0;
                    }
                    if (imageCountGotCallback != null) {
                        imageCountGotCallback.onGetMaxImageCount(i);
                    }
                }
            });
        }

        @TargetApi(21)
        public boolean onShowFileChooser(WebView webView, ValueCallback<Uri[]> valueCallback, FileChooserParams fileChooserParams) {
            if (OperationHybridClient.this.mContext == null) {
                Log.d("OperationHybridClient", "onShowFileChooser: already detached, do nothing");
                return false;
            }
            OperationHybridClient.this.mValueCallback = valueCallback;
            if (fileChooserParams.getMode() == 0) {
                OperationHybridClient.this.mMaxSelectCount = 1;
                startPicker(OperationHybridClient.this.mMaxSelectCount);
            } else {
                OperationHybridClient.this.mMaxSelectCount = 20;
                getFileChooserMaxImageCount(webView, new ImageCountGotCallback() {
                    public void onGetMaxImageCount(int i) {
                        if (i > 0) {
                            OperationHybridClient.this.mMaxSelectCount = Math.min(i, 20);
                        }
                        OperationWebChromeClientWrapper.this.startPicker(OperationHybridClient.this.mMaxSelectCount);
                    }
                });
            }
            return true;
        }

        public void startPicker(int i) {
            if (OperationHybridClient.this.mWebViewFragment != null) {
                Intent intent = new Intent("android.intent.action.GET_CONTENT");
                intent.setType("image/*");
                intent.putExtra("pick-upper-bound", i);
                intent.putExtra("pick_close_type", 3);
                intent.setPackage("com.miui.gallery");
                OperationHybridClient.this.mWebViewFragment.startActivityForResult(intent, 1);
            }
        }
    }

    public OperationHybridClient(Context context, String str) {
        super(context, str);
    }

    /* access modifiers changed from: private */
    public void gotoPhotoPage(String str) {
        if (this.mWebViewFragment != null && this.mWebViewFragment.getActivity() != null) {
            Intent intent = new Intent(this.mWebViewFragment.getActivity(), ExternalPhotoPageActivity.class);
            intent.setData(Uri.fromFile(new File(str)));
            this.mWebViewFragment.startActivity(intent);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:13:0x003e  */
    /* JADX WARNING: Removed duplicated region for block: B:19:? A[RETURN, SYNTHETIC] */
    private void receiveImages(Intent intent) {
        Uri[] uriArr;
        if (intent != null) {
            ClipData clipData = intent.getClipData();
            Uri data = intent.getData();
            if (clipData != null) {
                int itemCount = clipData.getItemCount();
                Uri[] uriArr2 = new Uri[itemCount];
                int min = Math.min(itemCount, this.mMaxSelectCount);
                for (int i = 0; i < min; i++) {
                    uriArr2[i] = resolveUri(clipData.getItemAt(i).getUri());
                }
                uriArr = uriArr2;
            } else if (data != null) {
                uriArr = new Uri[]{data};
            }
            if (VERSION.SDK_INT < 21) {
                if (this.mValueCallback != null) {
                    this.mValueCallback.onReceiveValue(uriArr);
                }
                this.mValueCallback = null;
                return;
            }
            return;
        }
        uriArr = null;
        if (VERSION.SDK_INT < 21) {
        }
    }

    private Uri resolveUri(Uri uri) {
        return uri.getAuthority().equals("com.miui.gallery.open") ? Uri.fromFile(new File(uri.getLastPathSegment())) : uri;
    }

    public List<JsInterfacePair> getJavascriptInterfaces() {
        List<JsInterfacePair> javascriptInterfaces = super.getJavascriptInterfaces();
        if (javascriptInterfaces == null) {
            javascriptInterfaces = new ArrayList<>(1);
        }
        javascriptInterfaces.add(new JsInterfacePair("MiuiGalleryOperationStoryJSBridge", new OperationStoryJSBridge()));
        return javascriptInterfaces;
    }

    public WebChromeClientWrapper getWebChromeClient(WebChromeClient webChromeClient) {
        return new OperationWebChromeClientWrapper(webChromeClient);
    }

    public boolean isSupportPullToRefresh() {
        return false;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 1) {
            if (i2 != -1) {
                receiveImages(null);
            } else {
                receiveImages(intent);
            }
        }
    }

    public void recordSaveEvent(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put("save_action", str);
        GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_operation_card_image_save_success", hashMap);
    }
}
