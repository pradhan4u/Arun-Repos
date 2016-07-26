trigger ContactUndelete on Contact (before update, before delete) {
	system.debug('Contact++++++++++++++++++trigger.isUpdate'+trigger.isUpdate);
   	system.debug('Contact++++++++++++++++++trigger.isDelete'+trigger.isDelete);
}