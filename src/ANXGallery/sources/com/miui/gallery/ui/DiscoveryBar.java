package com.miui.gallery.ui;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.discovery.DiscoveryMessageManager;
import com.miui.gallery.discovery.RecentDiscoveryMessageOperator.RecentMessageDetail;
import com.miui.gallery.model.DiscoveryMessage;
import com.miui.gallery.model.DiscoveryMessage.BaseMessageDetail;
import com.miui.gallery.ui.HomePageTopBarController.HomePageBar;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.PanelItemLayout;
import com.miui.gallery.widget.PanelManager;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import java.util.HashMap;
import java.util.List;

public class DiscoveryBar extends HomePageBar implements OnClickListener {
    private boolean mDiscoveryMessageClicked;
    private boolean mDiscoveryMessageShown;
    private List<DiscoveryMessage> mMessages;
    private PanelItemLayout mPanelItem;

    public DiscoveryBar(Context context, int i, PanelManager panelManager) {
        super(context, i, panelManager);
    }

    private boolean autoShowBar() {
        return true;
    }

    private void bindImage(ImageViewAware imageViewAware, String str, DisplayImageOptions displayImageOptions) {
        ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(str), (ImageAware) imageViewAware, displayImageOptions);
    }

    private void bindView(String str, String[] strArr, DisplayImageOptions displayImageOptions) {
        ensureView();
        PanelItemLayout panelItemLayout = this.mPanelItem;
        if (str == null) {
            str = "";
        }
        panelItemLayout.setTitle(str);
        this.mPanelItem.clearDetails();
        if (strArr != null && strArr.length > 0) {
            for (String bindImage : strArr) {
                bindImage(new ImageViewAware((ImageView) this.mPanelItem.addDetail((int) R.layout.message_thumb_item)), bindImage, displayImageOptions);
            }
        }
    }

    private void ensureView() {
        if (this.mPanelItem == null) {
            this.mPanelItem = new PanelItemLayout(getContext());
            this.mPanelItem.setOnClickListener(this);
        }
    }

    private String formatMessageClickTime(long j) {
        long currentTimeMillis = (System.currentTimeMillis() - j) / 60000;
        return currentTimeMillis < 1 ? "< 1 minute" : currentTimeMillis <= 3 ? "1-3 minutes" : currentTimeMillis <= 10 ? "4-10 minutes" : "> 10 minutes";
    }

    private DiscoveryMessage getFirstMessage() {
        if (MiscUtil.isValid(this.mMessages)) {
            return (DiscoveryMessage) this.mMessages.get(0);
        }
        return null;
    }

    private void recordMessageClickStatus() {
        if (this.mDiscoveryMessageShown) {
            HashMap hashMap = new HashMap();
            hashMap.put("is_message_clicked", String.valueOf(this.mDiscoveryMessageClicked));
            GallerySamplingStatHelper.recordCountEvent("quickly_discovery", "quickly_discovery_message_click_status", hashMap);
        }
    }

    private void recordMessageClickedTime(DiscoveryMessage discoveryMessage) {
        HashMap hashMap = new HashMap();
        hashMap.put("message_click_time", formatMessageClickTime(discoveryMessage.getUpdateTime()));
        GallerySamplingStatHelper.recordCountEvent("quickly_discovery", "quickly_discovery_message_click_time", hashMap);
    }

    public View getView() {
        ensureView();
        return this.mPanelItem.getView();
    }

    public void onClick(View view) {
        DiscoveryMessage firstMessage = getFirstMessage();
        if (firstMessage != null) {
            try {
                Intent intent = new Intent("android.intent.action.VIEW");
                Uri parse = Uri.parse(firstMessage.getActionUri());
                if (firstMessage.getType() == 1) {
                    intent.setPackage(getContext().getPackageName());
                    parse = parse.buildUpon().appendQueryParameter("source", "home_page").build();
                }
                intent.setData(parse);
                getContext().startActivity(intent);
            } catch (Exception e) {
                Log.e("DiscoveryBar", "Wrong intent action uri: %s", (Object) firstMessage.getActionUri());
                e.printStackTrace();
            }
            DiscoveryMessageManager.getInstance().markAsReadAsync(getContext(), firstMessage);
            recordMessageClickedTime(firstMessage);
            this.mDiscoveryMessageClicked = true;
        }
    }

    public void onDestroy() {
        recordMessageClickStatus();
    }

    public void onPause() {
    }

    public void onResume() {
    }

    public void setMessage(List<DiscoveryMessage> list) {
        this.mMessages = list;
        if (MiscUtil.isValid(list)) {
            DiscoveryMessage discoveryMessage = (DiscoveryMessage) list.get(0);
            String message = discoveryMessage.getMessage();
            String[] strArr = null;
            BaseMessageDetail messageDetail = discoveryMessage.getMessageDetail();
            if (messageDetail instanceof RecentMessageDetail) {
                strArr = ((RecentMessageDetail) messageDetail).getThumbUrls();
            }
            bindView(message, strArr, ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT);
            this.mPanelManager.addItem(this, autoShowBar());
            this.mDiscoveryMessageShown = true;
            return;
        }
        this.mPanelManager.removeItem(this, false);
    }
}
