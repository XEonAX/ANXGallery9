package com.miui.gallery.cloud.card;

import android.accounts.Account;
import android.text.TextUtils;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils;
import com.miui.gallery.cloud.HostManager.Story;
import com.miui.gallery.cloud.SyncConditionManager;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.base.RetryRequestHelper;
import com.miui.gallery.cloud.base.SyncTask;
import com.miui.gallery.cloud.card.exception.NoResultException;
import com.miui.gallery.cloud.card.model.CardInfo;
import com.miui.gallery.cloud.card.model.CardInfoList;
import com.miui.gallery.cloud.card.network.CommonGalleryRequestHelper;
import com.miui.gallery.cloud.card.network.RequestArguments;
import com.miui.gallery.cloud.card.network.ResponseCallback;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SyncLog;
import java.util.ArrayList;
import java.util.Locale;

public class SyncCardFromServer {
    protected Account mAccount;

    public interface OperationCardCallback {
        void onOperationCardGet(Card card);
    }

    public SyncCardFromServer(Account account) {
        this.mAccount = account;
    }

    public CardInfoList getCardInfoList(long j, String str, long j2) {
        try {
            return (CardInfoList) new CommonGalleryRequestHelper(new RequestArguments<CardInfoList>() {
                public int getMethod() {
                    return 1001;
                }

                public String getUrl() {
                    return Story.getCardInfosUrl();
                }
            }).addParam("syncTag", Long.toString(j)).addParam("limit", Long.toString(j2)).addParam("syncExtraInfo", str).addParam("language", Locale.getDefault().toString()).setUseCache(false).executeSync();
        } catch (RequestError e) {
            Log.e("SyncCardFromServer", "Get getCardInfoList failed, %s", (Object) e);
            return null;
        } catch (NoResultException e2) {
            Log.e("SyncCardFromServer", "Get getCardInfoList failed, %s", (Object) e2);
            return null;
        }
    }

    public void getOperationCards(final String str, final OperationCardCallback operationCardCallback) {
        final boolean z = this.mAccount != null;
        new CommonGalleryRequestHelper(new RequestArguments<CardInfoList>() {
            public int getMethod() {
                return z ? 1001 : 0;
            }

            public String getUrl() {
                return z ? Story.getOperationCardUrl() : Story.getOperationCardAnonymousUrl();
            }
        }).addParam("limit", Long.toString(10)).addParam("cardId", str).setUseCache(false).execute(new ResponseCallback<CardInfoList>() {
            public void onResponse(CardInfoList cardInfoList) {
                if (cardInfoList != null) {
                    ArrayList<CardInfo> galleryCards = cardInfoList.getGalleryCards();
                    if (MiscUtil.isValid(galleryCards)) {
                        for (CardInfo createOperationCardFromServer : galleryCards) {
                            Card createOperationCardFromServer2 = CardManager.getInstance().createOperationCardFromServer(createOperationCardFromServer);
                            if (!(createOperationCardFromServer2 == null || operationCardCallback == null || !TextUtils.equals(str, createOperationCardFromServer2.getServerId()))) {
                                operationCardCallback.onOperationCardGet(createOperationCardFromServer2);
                            }
                        }
                    }
                }
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
            }
        });
    }

    public final GallerySyncResult sync() {
        long currentTimeMillis = System.currentTimeMillis();
        while (SyncConditionManager.check(0) != 2) {
            GallerySyncResult retryTask = RetryRequestHelper.retryTask(new SyncTask<CardInfoList>() {
                public String getIdentifier() {
                    return Story.getCardInfosUrl();
                }

                public GallerySyncResult<CardInfoList> run() throws Exception {
                    return new Builder().setCode(GallerySyncCode.OK).setData(SyncCardFromServer.this.getCardInfoList(GalleryCloudSyncTagUtils.getCardSyncTag(SyncCardFromServer.this.mAccount), GalleryCloudSyncTagUtils.getCardSyncInfo(SyncCardFromServer.this.mAccount), 10)).build();
                }
            });
            CardInfoList cardInfoList = (CardInfoList) retryTask.data;
            if (cardInfoList != null) {
                ArrayList<CardInfo> galleryCards = cardInfoList.getGalleryCards();
                if (MiscUtil.isValid(galleryCards)) {
                    for (CardInfo updateCardFromServer : galleryCards) {
                        CardManager.getInstance().updateCardFromServer(updateCardFromServer);
                    }
                }
                GalleryCloudSyncTagUtils.setCardSyncTag(this.mAccount, cardInfoList.getSyncTag());
                GalleryCloudSyncTagUtils.setCardSyncInfo(this.mAccount, cardInfoList.getSyncExtraInfo());
                if (cardInfoList.isLastPage()) {
                    CardManager.getInstance().triggerGuaranteeScenarios(true);
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append("sync story card from server finish, cost time: ");
            sb.append(System.currentTimeMillis() - currentTimeMillis);
            SyncLog.d("SyncCardFromServer", sb.toString());
            return retryTask;
        }
        return new Builder().setCode(GallerySyncCode.CONDITION_INTERRUPTED).build();
    }
}
