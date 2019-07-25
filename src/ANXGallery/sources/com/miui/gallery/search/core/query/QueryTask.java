package com.miui.gallery.search.core.query;

import android.os.Handler;
import com.miui.gallery.search.core.Consumer;
import com.miui.gallery.search.core.ConsumerUtils;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.context.PriorityTaskExecutor.PriorityTask;
import com.miui.gallery.search.core.result.SuggestionResult;
import com.miui.gallery.search.core.source.SuggestionResultProvider;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import java.util.HashMap;

public class QueryTask<C extends SuggestionResult> extends PriorityTask {
    private final Consumer<C> mConsumer;
    private final Handler mHandler;
    private final SuggestionResultProvider<C> mProvider;
    private final QueryInfo mQueryInfo;

    public QueryTask(QueryInfo queryInfo, SuggestionResultProvider<C> suggestionResultProvider, Consumer<C> consumer, Handler handler, int i) {
        this.mQueryInfo = queryInfo;
        this.mProvider = suggestionResultProvider;
        this.mConsumer = consumer;
        this.mHandler = handler;
        this.mPriority = i;
    }

    public Void run(JobContext jobContext) {
        String str;
        if (jobContext.isCancelled()) {
            return null;
        }
        setExcuteTime(System.currentTimeMillis());
        SuggestionResult suggestions = this.mProvider.getSuggestions(this.mQueryInfo);
        if (jobContext.isCancelled()) {
            return null;
        }
        ConsumerUtils.consumeAsync(this.mHandler, this.mConsumer, suggestions);
        setFinishTime(System.currentTimeMillis());
        String str2 = "QueryTask";
        String str3 = "%s cost %sms, result %s";
        String queryTask = toString();
        String valueOf = String.valueOf(getFinishTime() - getExcuteTime());
        if (suggestions == null || suggestions.isEmpty() || suggestions.getData() == null) {
            str = "is empty";
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append(suggestions.getData().getCount());
            sb.append(" items@");
            sb.append(Integer.toHexString(suggestions.hashCode()));
            str = sb.toString();
        }
        SearchLog.d(str2, str3, queryTask, valueOf, str);
        HashMap hashMap = new HashMap();
        hashMap.put("submit_create", String.valueOf(getSubmitTime() - getNewTime()));
        hashMap.put("execute_submit", String.valueOf(getExcuteTime() - getSubmitTime()));
        hashMap.put("finish_execute", String.valueOf(getFinishTime() - getExcuteTime()));
        GallerySamplingStatHelper.recordCountEvent("search", "search_query_task", hashMap);
        return null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("From ");
        sb.append(this.mProvider);
        sb.append("[");
        sb.append(this.mQueryInfo);
        sb.append("]");
        return sb.toString();
    }
}
