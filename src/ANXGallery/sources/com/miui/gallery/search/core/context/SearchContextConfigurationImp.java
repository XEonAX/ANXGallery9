package com.miui.gallery.search.core.context;

import android.content.Context;
import com.miui.gallery.search.core.display.SuggestionViewFactory;
import com.miui.gallery.search.core.display.SuggestionViewFactoryImpl;
import com.miui.gallery.search.core.source.SearchableSources;
import com.miui.gallery.search.core.source.Sources;

public class SearchContextConfigurationImp implements SearchContextConfiguration {
    Builder mBuilder;

    public static class Builder {
        /* access modifiers changed from: private */
        public Context context;
        /* access modifiers changed from: private */
        public TaskExecutor iconLoaderCacheExecutor;
        private int iconLoaderCacheExecutorSize = 1;
        /* access modifiers changed from: private */
        public PriorityTaskExecutor iconLoaderExecutor;
        private int iconLoaderExecutorSize = 2;
        /* access modifiers changed from: private */
        public PriorityTaskExecutor queryTaskExecutor;
        private int queryTaskExecutorSize = 3;
        /* access modifiers changed from: private */
        public Sources sources;
        /* access modifiers changed from: private */
        public SuggestionViewFactory suggestionViewFactory;

        public Builder(Context context2) {
            this.context = context2;
        }

        private void initEmptyFieldsWithDefaultValues() {
            if (this.queryTaskExecutor == null) {
                this.queryTaskExecutor = new PriorityTaskExecutor(this.queryTaskExecutorSize);
            }
            if (this.suggestionViewFactory == null) {
                this.suggestionViewFactory = new SuggestionViewFactoryImpl(this.context);
            }
            if (this.sources == null) {
                this.sources = new SearchableSources(this.context);
            }
            if (this.iconLoaderExecutor == null) {
                this.iconLoaderExecutor = new PriorityTaskExecutor(this.iconLoaderExecutorSize);
            }
            if (this.iconLoaderCacheExecutor == null) {
                this.iconLoaderCacheExecutor = new SimpleTaskExecutor(this.iconLoaderCacheExecutorSize);
            }
        }

        public SearchContextConfigurationImp build() {
            initEmptyFieldsWithDefaultValues();
            return new SearchContextConfigurationImp(this);
        }
    }

    private SearchContextConfigurationImp(Builder builder) {
        this.mBuilder = builder;
    }

    public static SearchContextConfigurationImp createDefault(Context context) {
        return new Builder(context).build();
    }

    public Context getContext() {
        return this.mBuilder.context;
    }

    public TaskExecutor getIconLoaderCacheExecutor() {
        return this.mBuilder.iconLoaderCacheExecutor;
    }

    public PriorityTaskExecutor getIconLoaderExecutor() {
        return this.mBuilder.iconLoaderExecutor;
    }

    public PriorityTaskExecutor getQueryTaskExecutor() {
        return this.mBuilder.queryTaskExecutor;
    }

    public Sources getSources() {
        return this.mBuilder.sources;
    }

    public SuggestionViewFactory getSuggestionViewFactory() {
        return this.mBuilder.suggestionViewFactory;
    }
}
