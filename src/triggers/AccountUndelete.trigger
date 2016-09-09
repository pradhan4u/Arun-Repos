trigger AccountUndelete on Account (before update, before delete) {
	system.debug('Account++++++++++++++++++trigger.isUpdate'+trigger.isUpdate);
   	system.debug('Account++++++++++++++++++trigger.isDelete'+trigger.isDelete);
}