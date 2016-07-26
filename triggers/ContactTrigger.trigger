trigger ContactTrigger on Contact (before insert) {
 Contact[] contacts = Trigger.new;
}