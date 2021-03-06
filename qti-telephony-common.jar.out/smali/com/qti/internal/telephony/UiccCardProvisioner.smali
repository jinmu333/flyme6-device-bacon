.class public Lcom/qti/internal/telephony/UiccCardProvisioner;
.super Landroid/os/Handler;
.source "UiccCardProvisioner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;
    }
.end annotation


# static fields
.field private static final ACTION_UICC_MANUAL_PROVISION_STATUS_CHANGED:Ljava/lang/String; = "org.codeaurora.intent.action.ACTION_UICC_MANUAL_PROVISION_STATUS_CHANGED"

.field private static final DBG:Z = true

.field private static final EVENT_ICC_CHANGED:I = 0x1

.field private static final EVENT_MANUAL_PROVISION_DONE:I = 0x3

.field private static final EVENT_OEM_HOOK_SERVICE_READY:I = 0x4

.field private static final EVENT_UNSOL_MANUAL_PROVISION_STATUS_CHANGED:I = 0x2

.field private static final EXTRA_NEW_PROVISION_STATE:Ljava/lang/String; = "newProvisionState"

.field private static final GENERIC_FAILURE:I = -0x1

.field private static final INVALID_INPUT:I = -0x2

.field private static final LOG_TAG:Ljava/lang/String; = "UiccCardProvisioner"

.field private static final REQUEST_IN_PROGRESS:I = -0x3

.field private static final SUCCESS:I

.field private static final VDBG:Z

.field private static final mNumPhones:I

.field private static mRequestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

.field private static sManualProvLock:Ljava/lang/Object;


# instance fields
.field private mCardState:[Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

.field private mContext:Landroid/content/Context;

.field private mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

.field private mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

.field private mSimIccId:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 72
    const/4 v0, 0x0

    sput-object v0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    .line 73
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v0

    sput v0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    .line 74
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/qti/internal/telephony/UiccCardProvisioner;->sManualProvLock:Ljava/lang/Object;

    .line 75
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mRequestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 127
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 128
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " Invoking constructor, no of phones = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 129
    iput-object p1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mContext:Landroid/content/Context;

    .line 131
    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    new-array v1, v1, [Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    iput-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    .line 132
    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    .line 133
    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    new-array v1, v1, [Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    iput-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mCardState:[Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    .line 134
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    if-ge v0, v1, :cond_0

    .line 135
    iget-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    aput-object v3, v1, v0

    .line 136
    iget-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    new-instance v2, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    invoke-direct {v2}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;-><init>()V

    aput-object v2, v1, v0

    .line 137
    iget-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mCardState:[Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    sget-object v2, Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;->CARDSTATE_ABSENT:Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    aput-object v2, v1, v0

    .line 134
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 139
    :cond_0
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v1

    sput-object v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    .line 140
    sget-object v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/uicc/UiccController;->registerForIccChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 142
    invoke-static {p1}, Lcom/qti/internal/telephony/QtiRilInterface;->getInstance(Landroid/content/Context;)Lcom/qti/internal/telephony/QtiRilInterface;

    move-result-object v1

    iput-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    .line 143
    iget-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    const/4 v2, 0x4

    invoke-virtual {v1, p0, v2, v3}, Lcom/qti/internal/telephony/QtiRilInterface;->registerForServiceReadyEvent(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 144
    iget-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    const/4 v2, 0x2

    invoke-virtual {v1, p0, v2, v3}, Lcom/qti/internal/telephony/QtiRilInterface;->registerForUnsol(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 146
    return-void
.end method

.method private broadcastManualProvisionStatusChanged(II)V
    .locals 2
    .param p1, "phoneId"    # I
    .param p2, "newProvisionState"    # I

    .prologue
    .line 304
    new-instance v0, Landroid/content/Intent;

    const-string v1, "org.codeaurora.intent.action.ACTION_UICC_MANUAL_PROVISION_STATUS_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 305
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "phone"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 306
    const-string v1, "newProvisionState"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 307
    iget-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 308
    return-void
.end method

.method private canProcessRequest(I)Z
    .locals 3
    .param p1, "slotId"    # I

    .prologue
    .line 420
    const/4 v0, 0x0

    .line 422
    .local v0, "retVal":Z
    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->isValidSlotId(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 423
    const/4 v0, 0x1

    .line 427
    :goto_0
    return v0

    .line 425
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Request can\'t be processed, slotId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " numPhones "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->loge(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private enforceModifyPhoneState(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 414
    iget-object v0, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    return-void
.end method

.method private getCurrentProvisioningStatus(I)I
    .locals 2
    .param p1, "slotId"    # I

    .prologue
    .line 312
    sget-object v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->sManualProvLock:Ljava/lang/Object;

    monitor-enter v1

    .line 313
    :try_start_0
    iget-object v0, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->getCurrentState()I

    move-result v0

    monitor-exit v1

    return v0

    .line 314
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private handleUnsolManualProvisionEvent(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 199
    if-eqz p1, :cond_0

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v3, :cond_2

    .line 200
    :cond_0
    const-string v3, "Null data received in handleUnsolManualProvisionEvent"

    invoke-direct {p0, v3}, Lcom/qti/internal/telephony/UiccCardProvisioner;->loge(Ljava/lang/String;)V

    .line 214
    :cond_1
    :goto_0
    return-void

    .line 203
    :cond_2
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, [B

    check-cast v3, [B

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 204
    .local v0, "payload":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 206
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 207
    .local v1, "rspId":I
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 209
    .local v2, "slotId":I
    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->isValidSlotId(I)Z

    move-result v3

    if-eqz v3, :cond_1

    const v3, 0x80404

    if-ne v1, v3, :cond_1

    .line 211
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Unsol: rspId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " slotId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logi(Ljava/lang/String;)V

    .line 212
    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->queryUiccProvisionInfo(I)V

    goto :goto_0
.end method

.method private isFlexMapInProgress()Z
    .locals 4

    .prologue
    .line 440
    const/4 v1, 0x0

    .line 441
    .local v1, "retVal":Z
    invoke-static {}, Lcom/qti/internal/telephony/QtiRadioCapabilityController;->getInstance()Lcom/qti/internal/telephony/QtiRadioCapabilityController;

    move-result-object v0

    .line 443
    .local v0, "rcController":Lcom/qti/internal/telephony/QtiRadioCapabilityController;
    if-eqz v0, :cond_0

    .line 444
    invoke-virtual {v0}, Lcom/qti/internal/telephony/QtiRadioCapabilityController;->isSetNWModeInProgress()Z

    move-result v1

    .line 445
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isFlexMapInProgress: = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 448
    :cond_0
    return v1
.end method

.method private isValidSlotId(I)Z
    .locals 2
    .param p1, "slotId"    # I

    .prologue
    .line 431
    const/4 v0, 0x0

    .line 433
    .local v0, "retVal":Z
    if-ltz p1, :cond_0

    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    if-ge p1, v1, :cond_0

    .line 434
    const/4 v0, 0x1

    .line 436
    :cond_0
    return v0
.end method

.method private logd(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 456
    const-string v0, "UiccCardProvisioner"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 464
    const-string v0, "UiccCardProvisioner"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    return-void
.end method

.method private logi(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 460
    const-string v0, "UiccCardProvisioner"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 461
    return-void
.end method

.method private queryAllUiccProvisionInfo()V
    .locals 3

    .prologue
    .line 217
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    if-ge v0, v1, :cond_1

    .line 218
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " query  provision info, card state["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mCardState:[Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 219
    iget-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mCardState:[Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    aget-object v1, v1, v0

    sget-object v2, Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;->CARDSTATE_PRESENT:Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    if-ne v1, v2, :cond_0

    .line 220
    invoke-direct {p0, v0}, Lcom/qti/internal/telephony/UiccCardProvisioner;->queryUiccProvisionInfo(I)V

    .line 217
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 223
    :cond_1
    return-void
.end method

.method private queryUiccProvisionInfo(I)V
    .locals 7
    .param p1, "phoneId"    # I

    .prologue
    const/4 v6, -0x1

    .line 226
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v5}, Lcom/qti/internal/telephony/QtiRilInterface;->isServiceReady()Z

    move-result v5

    if-nez v5, :cond_1

    .line 227
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Oem hook service is not ready yet "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logi(Ljava/lang/String;)V

    .line 270
    :cond_0
    :goto_0
    return-void

    .line 230
    :cond_1
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v2, v5, p1

    .line 231
    .local v2, "oldStatus":Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    aget-object v1, v5, p1

    .line 233
    .local v1, "oldIccId":Ljava/lang/String;
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v5, p1}, Lcom/qti/internal/telephony/QtiRilInterface;->getUiccProvisionPreference(I)Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    move-result-object v4

    .line 234
    .local v4, "subStatus":Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;
    invoke-virtual {v4}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->getCurrentState()I

    move-result v5

    if-eq v5, v6, :cond_2

    invoke-virtual {v4}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->getUserPreference()I

    move-result v5

    if-eq v5, v6, :cond_2

    .line 236
    sget-object v6, Lcom/qti/internal/telephony/UiccCardProvisioner;->sManualProvLock:Ljava/lang/Object;

    monitor-enter v6

    .line 237
    :try_start_0
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aput-object v4, v5, p1

    .line 238
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 241
    :cond_2
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v5, p1}, Lcom/qti/internal/telephony/QtiRilInterface;->getUiccIccId(I)Ljava/lang/String;

    move-result-object v0

    .line 242
    .local v0, "iccId":Ljava/lang/String;
    if-eqz v0, :cond_4

    .line 244
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    aget-object v5, v5, p1

    if-nez v5, :cond_3

    .line 245
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "add subInfo record, iccId["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logi(Ljava/lang/String;)V

    .line 246
    invoke-static {}, Lcom/qti/internal/telephony/QtiSubscriptionInfoUpdater;->getInstance()Lcom/qti/internal/telephony/QtiSubscriptionInfoUpdater;

    move-result-object v5

    invoke-virtual {v5, p1, v0}, Lcom/qti/internal/telephony/QtiSubscriptionInfoUpdater;->addSubInfoRecord(ILjava/lang/String;)V

    .line 248
    :cond_3
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    aput-object v0, v5, p1

    .line 250
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " queryUiccProvisionInfo, iccId["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v6, v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 253
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    aget-object v5, v5, p1

    if-ne v5, v1, :cond_5

    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v5, v5, p1

    invoke-virtual {v2, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->equals(Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 254
    :cond_5
    iget-object v5, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    aget-object v5, v5, p1

    if-eqz v5, :cond_6

    .line 255
    invoke-static {}, Lcom/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v5

    invoke-virtual {v5, p1}, Lcom/qti/internal/telephony/QtiSubscriptionController;->getSubId(I)[I

    move-result-object v3

    .line 261
    .local v3, "subIds":[I
    if-eqz v3, :cond_6

    array-length v5, v3

    if-eqz v5, :cond_6

    invoke-static {}, Lcom/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v5

    const/4 v6, 0x0

    aget v6, v3, v6

    invoke-virtual {v5, v6}, Lcom/qti/internal/telephony/QtiSubscriptionController;->isActiveSubId(I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 263
    invoke-static {}, Lcom/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/qti/internal/telephony/QtiSubscriptionController;->updateUserPreferences()V

    .line 267
    .end local v3    # "subIds":[I
    :cond_6
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " broadcasting ProvisionInfo, phoneId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 268
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->getCurrentProvisioningStatus(I)I

    move-result v5

    invoke-direct {p0, p1, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner;->broadcastManualProvisionStatusChanged(II)V

    goto/16 :goto_0

    .line 238
    .end local v0    # "iccId":Ljava/lang/String;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5
.end method

.method private updateIccAvailability(I)V
    .locals 6
    .param p1, "slotId"    # I

    .prologue
    const/4 v5, -0x2

    .line 273
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->isValidSlotId(I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 274
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid slot Index!!! "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qti/internal/telephony/UiccCardProvisioner;->loge(Ljava/lang/String;)V

    .line 301
    :cond_0
    :goto_0
    return-void

    .line 277
    :cond_1
    sget-object v2, Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;->CARDSTATE_ABSENT:Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    .line 278
    .local v2, "newState":Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;
    sget-object v3, Lcom/qti/internal/telephony/UiccCardProvisioner;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    invoke-virtual {v3, p1}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCard(I)Lcom/android/internal/telephony/uicc/UiccCard;

    move-result-object v1

    .line 279
    .local v1, "newCard":Lcom/android/internal/telephony/uicc/UiccCard;
    if-eqz v1, :cond_3

    .line 280
    invoke-virtual {v1}, Lcom/android/internal/telephony/uicc/UiccCard;->getCardState()Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    move-result-object v2

    .line 285
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateIccAvailability, card state["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 287
    iget-object v3, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mCardState:[Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    aput-object v2, v3, p1

    .line 288
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->getCurrentProvisioningStatus(I)I

    move-result v0

    .line 289
    .local v0, "currentState":I
    iget-object v3, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mCardState:[Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    aget-object v3, v3, p1

    sget-object v4, Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;->CARDSTATE_PRESENT:Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    if-ne v3, v4, :cond_4

    iget-object v3, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    aget-object v3, v3, p1

    if-eqz v3, :cond_2

    const/4 v3, -0x1

    if-eq v0, v3, :cond_2

    if-ne v0, v5, :cond_4

    .line 293
    :cond_2
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->queryUiccProvisionInfo(I)V

    goto :goto_0

    .line 282
    .end local v0    # "currentState":I
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateIccAvailability, uicc card null, ignore "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 294
    .restart local v0    # "currentState":I
    :cond_4
    iget-object v3, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mCardState:[Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    aget-object v3, v3, p1

    sget-object v4, Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;->CARDSTATE_ABSENT:Lcom/android/internal/telephony/uicc/IccCardStatus$CardState;

    if-ne v3, v4, :cond_0

    .line 295
    sget-object v4, Lcom/qti/internal/telephony/UiccCardProvisioner;->sManualProvLock:Ljava/lang/Object;

    monitor-enter v4

    .line 296
    :try_start_0
    iget-object v3, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v3, v3, p1

    const/4 v5, -0x2

    invoke-virtual {v3, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->setUserPreference(I)V

    .line 297
    iget-object v3, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v3, v3, p1

    const/4 v5, -0x2

    invoke-virtual {v3, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->setCurrentState(I)V

    .line 298
    iget-object v3, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mSimIccId:[Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v5, v3, p1

    .line 299
    monitor-exit v4

    goto/16 :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method


# virtual methods
.method public activateUiccCard(I)I
    .locals 7
    .param p1, "slotId"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 347
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " activateUiccCard: phoneId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 349
    const-string v2, "activateUiccCard"

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->enforceModifyPhoneState(Ljava/lang/String;)V

    .line 351
    const/4 v0, 0x0

    .line 353
    .local v0, "activateStatus":I
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->canProcessRequest(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 354
    const/4 v0, -0x2

    .line 377
    :goto_0
    return v0

    .line 355
    :cond_0
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->getCurrentProvisioningStatus(I)I

    move-result v2

    if-ne v2, v5, :cond_1

    .line 356
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " Uicc card in slot["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] already activated "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 357
    :cond_1
    invoke-direct {p0}, Lcom/qti/internal/telephony/UiccCardProvisioner;->isFlexMapInProgress()Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v2, Lcom/qti/internal/telephony/UiccCardProvisioner;->mRequestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v6, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 358
    const/4 v1, 0x0

    .line 360
    .local v1, "retVal":Z
    iget-object v2, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v2, v5, p1}, Lcom/qti/internal/telephony/QtiRilInterface;->setUiccProvisionPreference(II)Z

    move-result v1

    .line 362
    if-nez v1, :cond_2

    .line 363
    const/4 v0, -0x1

    .line 371
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " activation result["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logi(Ljava/lang/String;)V

    .line 372
    sget-object v2, Lcom/qti/internal/telephony/UiccCardProvisioner;->mRequestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0

    .line 365
    :cond_2
    sget-object v3, Lcom/qti/internal/telephony/UiccCardProvisioner;->sManualProvLock:Ljava/lang/Object;

    monitor-enter v3

    .line 366
    :try_start_0
    iget-object v2, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v2, v2, p1

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->setCurrentState(I)V

    .line 367
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 368
    const/4 v2, 0x3

    invoke-virtual {p0, v2, p1, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .line 367
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 374
    .end local v1    # "retVal":Z
    :cond_3
    const/4 v0, -0x3

    goto :goto_0
.end method

.method public deactivateUiccCard(I)I
    .locals 6
    .param p1, "slotId"    # I

    .prologue
    const/4 v5, 0x0

    .line 381
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " deactivateUiccCard: phoneId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 383
    const-string v2, "deactivateUiccCard"

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->enforceModifyPhoneState(Ljava/lang/String;)V

    .line 385
    const/4 v0, 0x0

    .line 386
    .local v0, "deactivateState":I
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->canProcessRequest(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 387
    const/4 v0, -0x2

    .line 410
    :goto_0
    return v0

    .line 388
    :cond_0
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->getCurrentProvisioningStatus(I)I

    move-result v2

    if-nez v2, :cond_1

    .line 389
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " Uicc card in slot["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] already in deactive state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 390
    :cond_1
    invoke-direct {p0}, Lcom/qti/internal/telephony/UiccCardProvisioner;->isFlexMapInProgress()Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v2, Lcom/qti/internal/telephony/UiccCardProvisioner;->mRequestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v5, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 391
    const/4 v1, 0x0

    .line 393
    .local v1, "retVal":Z
    iget-object v2, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mQtiRilInterface:Lcom/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v2, v5, p1}, Lcom/qti/internal/telephony/QtiRilInterface;->setUiccProvisionPreference(II)Z

    move-result v1

    .line 395
    if-nez v1, :cond_2

    .line 396
    const/4 v0, -0x1

    .line 404
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " deactivation result["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logi(Ljava/lang/String;)V

    .line 405
    sget-object v2, Lcom/qti/internal/telephony/UiccCardProvisioner;->mRequestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0

    .line 398
    :cond_2
    sget-object v3, Lcom/qti/internal/telephony/UiccCardProvisioner;->sManualProvLock:Ljava/lang/Object;

    monitor-enter v3

    .line 399
    :try_start_0
    iget-object v2, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v2, v2, p1

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->setCurrentState(I)V

    .line 400
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 401
    const/4 v2, 0x3

    invoke-virtual {p0, v2, p1, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qti/internal/telephony/UiccCardProvisioner;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .line 400
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 407
    .end local v1    # "retVal":Z
    :cond_3
    const/4 v0, -0x3

    goto :goto_0
.end method

.method public getCurrentUiccCardProvisioningStatus(I)I
    .locals 3
    .param p1, "slotId"    # I

    .prologue
    .line 318
    const/4 v0, -0x1

    .line 321
    .local v0, "currentStatus":I
    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->isValidSlotId(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 322
    const/4 v0, 0x1

    .line 328
    :cond_0
    :goto_0
    return v0

    .line 323
    :cond_1
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->canProcessRequest(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 324
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->getCurrentProvisioningStatus(I)I

    move-result v0

    goto :goto_0
.end method

.method public getUiccCardProvisioningUserPreference(I)I
    .locals 3
    .param p1, "slotId"    # I

    .prologue
    .line 332
    const/4 v0, -0x1

    .line 335
    .local v0, "userPref":I
    sget v1, Lcom/qti/internal/telephony/UiccCardProvisioner;->mNumPhones:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->isValidSlotId(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 336
    const/4 v0, 0x1

    .line 343
    :cond_0
    :goto_0
    return v0

    .line 337
    :cond_1
    invoke-direct {p0, p1}, Lcom/qti/internal/telephony/UiccCardProvisioner;->canProcessRequest(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 338
    sget-object v2, Lcom/qti/internal/telephony/UiccCardProvisioner;->sManualProvLock:Ljava/lang/Object;

    monitor-enter v2

    .line 339
    :try_start_0
    iget-object v1, p0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mProvisionStatus:[Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lcom/qti/internal/telephony/UiccCardProvisioner$UiccProvisionStatus;->getUserPreference()I

    move-result v0

    .line 340
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 152
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    .line 193
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error: hit default case "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner;->loge(Ljava/lang/String;)V

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 154
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 155
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v4, :cond_1

    .line 156
    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner;->updateIccAvailability(I)V

    goto :goto_0

    .line 158
    :cond_1
    const-string v4, "Error: Invalid card index EVENT_ICC_CHANGED "

    invoke-direct {p0, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 162
    .end local v0    # "ar":Landroid/os/AsyncResult;
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 163
    .restart local v0    # "ar":Landroid/os/AsyncResult;
    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v4, :cond_2

    .line 164
    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 165
    .local v1, "isServiceReady":Z
    if-eqz v1, :cond_0

    .line 166
    invoke-direct {p0}, Lcom/qti/internal/telephony/UiccCardProvisioner;->queryAllUiccProvisionInfo()V

    goto :goto_0

    .line 169
    .end local v1    # "isServiceReady":Z
    :cond_2
    const-string v4, "Error: empty result, EVENT_OEM_HOOK_SERVICE_READY"

    invoke-direct {p0, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 174
    .end local v0    # "ar":Landroid/os/AsyncResult;
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 175
    .restart local v0    # "ar":Landroid/os/AsyncResult;
    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v4, :cond_3

    .line 176
    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Landroid/os/Message;

    invoke-direct {p0, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner;->handleUnsolManualProvisionEvent(Landroid/os/Message;)V

    goto :goto_0

    .line 178
    :cond_3
    const-string v4, "Error: empty result, UNSOL_MANUAL_PROVISION_STATUS_CHANGED"

    invoke-direct {p0, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 183
    .end local v0    # "ar":Landroid/os/AsyncResult;
    :pswitch_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " MANUAL_PROVISION_STATUS_CHANGED, pref["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/qti/internal/telephony/UiccCardProvisioner;->logd(Ljava/lang/String;)V

    .line 184
    iget v3, p1, Landroid/os/Message;->arg1:I

    .line 185
    .local v3, "slotId":I
    iget v2, p1, Landroid/os/Message;->arg2:I

    .line 186
    .local v2, "newProvisionState":I
    invoke-direct {p0, v3}, Lcom/qti/internal/telephony/UiccCardProvisioner;->getCurrentProvisioningStatus(I)I

    move-result v4

    if-eq v4, v2, :cond_0

    .line 187
    invoke-static {}, Lcom/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/qti/internal/telephony/QtiSubscriptionController;->updateUserPreferences()V

    .line 188
    iget v4, p1, Landroid/os/Message;->arg1:I

    iget v5, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v4, v5}, Lcom/qti/internal/telephony/UiccCardProvisioner;->broadcastManualProvisionStatusChanged(II)V

    goto/16 :goto_0

    .line 152
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method public isAnyProvisionRequestInProgress()Z
    .locals 1

    .prologue
    .line 452
    sget-object v0, Lcom/qti/internal/telephony/UiccCardProvisioner;->mRequestInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method
