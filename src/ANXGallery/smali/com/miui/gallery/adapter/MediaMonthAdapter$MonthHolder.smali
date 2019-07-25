.class Lcom/miui/gallery/adapter/MediaMonthAdapter$MonthHolder;
.super Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
.source "MediaMonthAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/MediaMonthAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MonthHolder"
.end annotation


# instance fields
.field mItemView:Lcom/miui/gallery/ui/MonthView;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/MonthView;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter$MonthHolder;->mItemView:Lcom/miui/gallery/ui/MonthView;

    return-void
.end method
