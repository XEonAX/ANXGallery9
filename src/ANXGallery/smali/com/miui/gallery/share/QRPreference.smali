.class public Lcom/miui/gallery/share/QRPreference;
.super Landroid/preference/Preference;
.source "QRPreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/QRPreference$Status;
    }
.end annotation


# instance fields
.field private mQRCodeRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mRetryListener:Landroid/view/View$OnClickListener;

.field private mStatus:Lcom/miui/gallery/share/QRPreference$Status;

.field private mTextQR:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/share/QRPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object p1, Lcom/miui/gallery/share/QRPreference$Status;->REQUESTING:Lcom/miui/gallery/share/QRPreference$Status;

    iput-object p1, p0, Lcom/miui/gallery/share/QRPreference;->mStatus:Lcom/miui/gallery/share/QRPreference$Status;

    const p1, 0x7f0b0158

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/QRPreference;->setLayoutResource(I)V

    return-void
.end method

.method private getQRCodeParentSize()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/share/QRPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0603b7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method private update(Landroid/view/View;)V
    .locals 6

    const v0, 0x7f090243

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090245

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f090244

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/miui/gallery/share/QRPreference;->mStatus:Lcom/miui/gallery/share/QRPreference$Status;

    sget-object v3, Lcom/miui/gallery/share/QRPreference$Status;->REQUESTING:Lcom/miui/gallery/share/QRPreference$Status;

    const/4 v4, 0x0

    const/16 v5, 0x8

    if-ne v2, v3, :cond_0

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/share/QRPreference;->mStatus:Lcom/miui/gallery/share/QRPreference$Status;

    sget-object v3, Lcom/miui/gallery/share/QRPreference$Status;->FAILED:Lcom/miui/gallery/share/QRPreference$Status;

    if-ne v2, v3, :cond_1

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/share/QRPreference;->mStatus:Lcom/miui/gallery/share/QRPreference$Status;

    sget-object v3, Lcom/miui/gallery/share/QRPreference$Status;->SUCCESS:Lcom/miui/gallery/share/QRPreference$Status;

    if-ne v2, v3, :cond_5

    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/share/QRPreference;->mTextQR:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1

    :cond_2
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    iget-object v0, p0, Lcom/miui/gallery/share/QRPreference;->mQRCodeRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/share/QRPreference;->mQRCodeRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_3
    move-object v0, v1

    :goto_0
    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/share/QRPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f060025

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/share/QRPreference;->mTextQR:Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/zxing/encoding/EncodingHandler;->createQRCode(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_4

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/miui/gallery/share/QRPreference;->mQRCodeRef:Ljava/lang/ref/WeakReference;

    :cond_4
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Lcom/google/zxing/WriterException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1

    :catch_1
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_5
    :goto_1
    return-void
.end method


# virtual methods
.method public getQRText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/QRPreference;->mTextQR:Ljava/lang/String;

    return-object v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/miui/gallery/share/QRPreference;->getQRCodeParentSize()I

    move-result v0

    const v1, 0x7f090242

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    const v0, 0x7f090268

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/share/QRPreference;->update(Landroid/view/View;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/QRPreference;->mRetryListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/QRPreference;->mRetryListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setQRText(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/QRPreference;->mTextQR:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/share/QRPreference;->mTextQR:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/share/QRPreference;->mQRCodeRef:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method public setRetryListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/QRPreference;->mRetryListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public setStatus(Lcom/miui/gallery/share/QRPreference$Status;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/QRPreference;->mStatus:Lcom/miui/gallery/share/QRPreference$Status;

    invoke-virtual {p0}, Lcom/miui/gallery/share/QRPreference;->notifyChanged()V

    return-void
.end method
