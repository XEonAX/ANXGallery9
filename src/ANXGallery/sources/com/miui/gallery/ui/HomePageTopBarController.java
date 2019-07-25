package com.miui.gallery.ui;

import android.app.Activity;
import android.content.Context;
import com.miui.gallery.model.DiscoveryMessage;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.OnAppFocusedListener;
import com.miui.gallery.widget.PanelBar;
import com.miui.gallery.widget.PanelItem;
import com.miui.gallery.widget.PanelManager;
import com.miui.gallery.widget.TwoStageDrawer;
import com.miui.gallery.widget.TwoStageDrawer.DrawerAnimEndListener;
import com.miui.gallery.widget.TwoStageDrawer.DrawerListener;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.PriorityQueue;

public class HomePageTopBarController implements OnAppFocusedListener, DrawerListener {
    private Activity mActivity;
    private Runnable mDelayShowBarRunnable;
    private DiscoveryBar mDiscoveryBar;
    /* access modifiers changed from: private */
    public TwoStageDrawer mDrawer;
    private PanelItemManager mItemManager;
    private SyncBar mSyncBar;

    public static abstract class HomePageBar implements PanelItem {
        protected final Context mContext;
        protected final PanelManager mPanelManager;
        protected boolean mPermanent;
        protected int mPriority;

        public HomePageBar(Context context, int i, PanelManager panelManager) {
            this.mContext = context;
            this.mPanelManager = panelManager;
            this.mPriority = i;
        }

        public Context getContext() {
            return this.mContext;
        }

        public int getPriority() {
            return this.mPriority;
        }

        public boolean isPermanent() {
            return this.mPermanent;
        }

        public void setPermanent(boolean z) {
            this.mPermanent = z;
        }
    }

    private class PanelItemManager implements PanelManager {
        private Comparator<PanelItem> mComparator;
        /* access modifiers changed from: private */
        public PanelItem mCurrentItem;
        private boolean mIsItemEnable = true;
        /* access modifiers changed from: private */
        public PanelBar mPanelBar;
        private PriorityQueue<PanelItem> mWaitingItems;

        public PanelItemManager(PanelBar panelBar) {
            this.mPanelBar = panelBar;
            this.mComparator = new Comparator<PanelItem>(HomePageTopBarController.this) {
                public int compare(PanelItem panelItem, PanelItem panelItem2) {
                    if (panelItem == null && panelItem2 == null) {
                        return 0;
                    }
                    if (panelItem == null) {
                        return -1;
                    }
                    if (panelItem2 == null) {
                        return 1;
                    }
                    return panelItem.getPriority() - panelItem2.getPriority();
                }
            };
            this.mWaitingItems = new PriorityQueue<>(10, this.mComparator);
        }

        public boolean addItem(PanelItem panelItem, boolean z) {
            if (!(panelItem == null || panelItem.getView() == null)) {
                panelItem.getView().setClickable(this.mIsItemEnable);
                panelItem.getView().setEnabled(this.mIsItemEnable);
            }
            PanelItem panelItem2 = this.mCurrentItem;
            if (this.mCurrentItem == null) {
                this.mCurrentItem = panelItem;
            } else if (this.mCurrentItem != panelItem) {
                if (this.mComparator.compare(this.mCurrentItem, panelItem) >= 0) {
                    if (!this.mWaitingItems.contains(panelItem)) {
                        this.mWaitingItems.offer(panelItem);
                    }
                    return false;
                }
                if (!this.mWaitingItems.contains(this.mCurrentItem)) {
                    this.mWaitingItems.offer(this.mCurrentItem);
                }
                this.mCurrentItem = panelItem;
            }
            if (z) {
                if (panelItem2 == null || panelItem2 == this.mCurrentItem || !HomePageTopBarController.this.isPanelBarOpened() || HomePageTopBarController.this.isPanelBarAniming()) {
                    if (panelItem2 != this.mCurrentItem) {
                        this.mPanelBar.replaceItem(this.mCurrentItem, HomePageTopBarController.this.isPanelBarAniming());
                    }
                    HomePageTopBarController.this.delayShowPanelBar(panelItem2 == null ? 600 : 300);
                } else {
                    HomePageTopBarController.this.closePanelBar(true, new DrawerAnimEndListener() {
                        public void onDrawerAnimEnd(boolean z) {
                            PanelItemManager.this.mPanelBar.replaceItem(PanelItemManager.this.mCurrentItem, false);
                            HomePageTopBarController.this.showPanelBar(true, null);
                        }
                    });
                }
            } else if (panelItem2 != this.mCurrentItem) {
                this.mPanelBar.replaceItem(this.mCurrentItem, false);
            }
            return true;
        }

        public boolean hasItem() {
            return this.mCurrentItem != null;
        }

        public boolean removeItem(PanelItem panelItem, boolean z) {
            final PanelItem panelItem2 = this.mCurrentItem;
            if (this.mCurrentItem != panelItem) {
                return this.mWaitingItems.remove(panelItem);
            }
            this.mCurrentItem = (PanelItem) this.mWaitingItems.poll();
            if (this.mCurrentItem != null) {
                this.mPanelBar.replaceItem(this.mCurrentItem, false);
            } else {
                this.mPanelBar.removeItem(false);
            }
            if (z) {
                HomePageTopBarController.this.closePanelBar(true, new DrawerAnimEndListener() {
                    public void onDrawerAnimEnd(boolean z) {
                        if (PanelItemManager.this.mCurrentItem != null && panelItem2 != PanelItemManager.this.mCurrentItem) {
                            HomePageTopBarController.this.showPanelBar(true, null);
                        }
                    }
                });
            } else {
                HomePageTopBarController.this.closePanelBar(false, null);
            }
            return true;
        }

        public void setItemEnable(boolean z) {
            if (z != this.mIsItemEnable) {
                this.mIsItemEnable = z;
                if (!(this.mCurrentItem == null || this.mCurrentItem.getView() == null)) {
                    this.mCurrentItem.getView().setEnabled(z);
                    this.mCurrentItem.getView().setClickable(z);
                }
                if (MiscUtil.isValid(this.mWaitingItems)) {
                    Iterator it = this.mWaitingItems.iterator();
                    while (it.hasNext()) {
                        PanelItem panelItem = (PanelItem) it.next();
                        if (panelItem.getView() != null) {
                            panelItem.getView().setEnabled(z);
                            panelItem.getView().setClickable(z);
                        }
                    }
                }
            }
        }
    }

    public HomePageTopBarController(Activity activity, TwoStageDrawer twoStageDrawer, int i) {
        this.mActivity = activity;
        this.mDrawer = twoStageDrawer;
        this.mDrawer.setDrawerListener(this);
        this.mItemManager = new PanelItemManager((PanelBar) this.mDrawer.findViewById(i));
        this.mDrawer.post(new Runnable() {
            public void run() {
                HomePageTopBarController.this.mDrawer.halfOpenDrawer();
            }
        });
        this.mSyncBar = new SyncBar(activity, 0, this.mItemManager);
        this.mDiscoveryBar = new DiscoveryBar(activity, 1, this.mItemManager);
    }

    /* access modifiers changed from: private */
    public void closePanelBar(boolean z, DrawerAnimEndListener drawerAnimEndListener) {
        removeShowPanelBarMessage();
        if (this.mDrawer.isDrawerOpen()) {
            this.mDrawer.halfCloseDrawer(z, drawerAnimEndListener);
        }
    }

    /* access modifiers changed from: private */
    public void delayShowPanelBar(int i) {
        if (this.mDelayShowBarRunnable == null) {
            this.mDelayShowBarRunnable = new Runnable() {
                public void run() {
                    HomePageTopBarController.this.showPanelBar(true, null);
                }
            };
        }
        removeShowPanelBarMessage();
        ThreadManager.getMainHandler().postDelayed(this.mDelayShowBarRunnable, (long) i);
    }

    /* access modifiers changed from: private */
    public boolean isPanelBarAniming() {
        return this.mDrawer.isAnimating();
    }

    /* access modifiers changed from: private */
    public boolean isPanelBarOpened() {
        return this.mDrawer.isDrawerOpen();
    }

    private void removeShowPanelBarMessage() {
        ThreadManager.getMainHandler().removeCallbacks(this.mDelayShowBarRunnable);
    }

    /* access modifiers changed from: private */
    public void showPanelBar(boolean z, DrawerAnimEndListener drawerAnimEndListener) {
        removeShowPanelBarMessage();
        this.mDrawer.openDrawer(z, drawerAnimEndListener);
    }

    public void onAppFocused() {
        this.mSyncBar.onAppFocused();
    }

    public void onDestroy() {
        this.mSyncBar.onDestroy();
        this.mDiscoveryBar.onDestroy();
    }

    public void onDrawerClose(TwoStageDrawer twoStageDrawer) {
    }

    public void onDrawerHalfOpen(TwoStageDrawer twoStageDrawer) {
    }

    public void onDrawerOpen(TwoStageDrawer twoStageDrawer) {
    }

    public void onDrawerSlide(TwoStageDrawer twoStageDrawer, float f) {
    }

    public void onPause() {
        this.mSyncBar.onPause();
        this.mDiscoveryBar.onPause();
        removeShowPanelBarMessage();
    }

    public void onResume() {
        this.mSyncBar.onResume();
        this.mDiscoveryBar.onResume();
    }

    public void setDiscoveryMessage(ArrayList<DiscoveryMessage> arrayList) {
        this.mDiscoveryBar.setMessage(arrayList);
    }

    public void setEnable(boolean z) {
        this.mItemManager.setItemEnable(z);
    }

    public void setPermanent(boolean z) {
        this.mSyncBar.setPermanent(z);
        this.mDiscoveryBar.setPermanent(z);
        if (z && this.mItemManager.hasItem()) {
            showPanelBar(false, null);
        }
    }
}
