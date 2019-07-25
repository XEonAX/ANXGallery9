package com.miui.gallery.card.ui.cardlist;

import android.os.Bundle;
import android.os.Looper;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.card.CardManager.CardObserver;
import com.miui.gallery.preference.GalleryPreferences.Assistant;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureHandler;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.BaseFragment;
import com.miui.gallery.util.DividerItemDecoration;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.widget.EmptyPage;
import com.miui.gallery.widget.LoadMoreLayout;
import java.util.List;

public class AssistantPageFragment extends BaseFragment {
    /* access modifiers changed from: private */
    public CardAdapter mAdapter;
    private final AdapterDataObserver mAdapterDataObserver = new AdapterDataObserver() {
        public void onChanged() {
            if (AssistantPageFragment.this.mAdapter.getDataItemSize() < 20) {
                AssistantPageFragment.this.loadMoreCard();
            }
        }
    };
    private final CardObserver mCardObserver = new CardObserver() {
        public void onCardAdded(int i, Card card) {
            AssistantPageFragment.this.updateCardList();
        }

        public void onCardDeleted(int i, Card card) {
            AssistantPageFragment.this.updateCardList();
        }

        public void onCardUpdated(int i, Card card) {
            AssistantPageFragment.this.updateCard(i, card);
        }
    };
    private EmptyPage mEmptyPage;
    /* access modifiers changed from: private */
    public boolean mHasMore = true;
    /* access modifiers changed from: private */
    public boolean mIsFirstLoad = true;
    /* access modifiers changed from: private */
    public boolean mIsLoading = false;
    private LayoutManager mLayoutManager;
    /* access modifiers changed from: private */
    public LoadMoreLayout mLoadMoreLayout;
    private RecyclerView mRecyclerView;
    private final Runnable mScrollToBottomListener = new Runnable() {
        public void run() {
            AssistantPageFragment.this.loadMoreCard();
        }
    };

    /* access modifiers changed from: private */
    public void loadMoreCard() {
        if (!this.mIsLoading && this.mHasMore && this.mUserFirstVisible) {
            Log.d("AssistantPageFragment", "loadMoreCard");
            this.mIsLoading = true;
            this.mLoadMoreLayout.startLoad();
            ThreadManager.getMiscPool().submit(new Job<List<Card>>() {
                public List<Card> run(JobContext jobContext) {
                    return CardManager.getInstance().loadMoreCard();
                }
            }, new FutureHandler<List<Card>>() {
                public void onPostExecute(Future<List<Card>> future) {
                    if (AssistantPageFragment.this.mActivity != null) {
                        List list = (List) future.get();
                        if (list == null || list.size() < 20) {
                            AssistantPageFragment.this.mLoadMoreLayout.setLoadComplete();
                            List loadedCard = CardManager.getInstance().getLoadedCard();
                            if (loadedCard != null && loadedCard.size() > 20) {
                                AssistantPageFragment.this.mAdapter.setFooter(AssistantPageFragment.this.mLoadMoreLayout, true);
                            }
                            AssistantPageFragment.this.mHasMore = false;
                        } else if (AssistantPageFragment.this.mIsFirstLoad) {
                            AssistantPageFragment.this.mAdapter.setFooter(AssistantPageFragment.this.mLoadMoreLayout, true);
                        }
                        AssistantPageFragment.this.updateCardList();
                        AssistantPageFragment.this.mIsLoading = false;
                        AssistantPageFragment.this.mIsFirstLoad = false;
                    }
                }
            });
        }
    }

    private void postOnUiThread(Runnable runnable) {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            runnable.run();
        } else {
            ThreadManager.getMainHandler().post(runnable);
        }
    }

    /* access modifiers changed from: private */
    public void updateCard(final int i, Card card) {
        if (i >= 0) {
            postOnUiThread(new Runnable() {
                public void run() {
                    AssistantPageFragment.this.mAdapter.refreshNotifyItemChanged(i);
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void updateCardList() {
        postOnUiThread(new Runnable() {
            public void run() {
                AssistantPageFragment.this.mAdapter.updateDataList(CardManager.getInstance().getLoadedCard());
            }
        });
    }

    public String getPageName() {
        return "assistant";
    }

    public void onDestroy() {
        super.onDestroy();
        CardManager.getInstance().unregisterObserver(this.mCardObserver);
        if (this.mAdapter != null) {
            this.mAdapter.unregisterAdapterDataObserver(this.mAdapterDataObserver);
        }
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.assistant_page, viewGroup, false);
        this.mRecyclerView = (RecyclerView) inflate.findViewById(R.id.recycler_view);
        this.mLayoutManager = new LinearLayoutManager(getActivity());
        this.mRecyclerView.setLayoutManager(this.mLayoutManager);
        this.mRecyclerView.addItemDecoration(new DividerItemDecoration(getActivity().getResources().getDrawable(R.drawable.card_divider_no_stroke), 0, 1));
        this.mRecyclerView.setItemAnimator(null);
        MiscUtil.setRecyclerViewScrollToBottomListener(this.mRecyclerView, this.mScrollToBottomListener);
        this.mAdapter = new CardAdapter(getActivity());
        this.mAdapter.registerAdapterDataObserver(this.mAdapterDataObserver);
        this.mLoadMoreLayout = (LoadMoreLayout) layoutInflater.inflate(R.layout.load_more_layout, this.mRecyclerView, false);
        this.mEmptyPage = (EmptyPage) layoutInflater.inflate(R.layout.cardlist_page_empty_view, this.mRecyclerView, false);
        this.mEmptyPage.setActionButtonVisible(false);
        this.mEmptyPage.setDescription(Assistant.hasCardEver() ? R.string.empty_description_no_cards : R.string.empty_description_conditions);
        this.mAdapter.setEmptyView(this.mEmptyPage);
        this.mRecyclerView.setAdapter(this.mAdapter);
        CardManager.getInstance().registerObserver(this.mCardObserver);
        return inflate;
    }

    /* access modifiers changed from: protected */
    public void onUserFirstVisible() {
        Log.d("AssistantPageFragment", "onUserFirstVisible");
        loadMoreCard();
    }

    /* access modifiers changed from: protected */
    public boolean recordPageByDefault() {
        return false;
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (z) {
            GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_tab_page_view");
        }
    }
}
