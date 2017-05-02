ucberkeley_envconf 7.x-2.4.0
--------------------------
* Begin using semantic versioning.
* openucb-1557: Update the ucberkeley_envconf_cas_backup_server value to use
the new cluster URI as opposed to a single server.

ucberkeley_envconf 7.x-2.3
--------------------------
* OPENUCB-957: Should auth.berkeley.edu become unavailable, quickly switch to 
the backup CAS server (cas-p4.calnet.berkeley.edu) with 
'drush vset ucberkeley_envconf_cas_backup_server_enabled 1' (0 == off).

ucberkeley_envconf 7.x-2.2
--------------------------
* OPENUCB-768: Remove code that manages cas attributes. Cleaner and more 
efficient. Fixes a bug introduced in 2.1 where the attributes of CAS 
administrators added during a drush site install are not populated.

ucberkeley_envconf 7.x-2.1
--------------------------
* OPENUCB-768 remove ldap-test.berkeley.edu configuration.  Ldap-test is 
  sporadically unavailable.  CalNet team approves us using production LDAP 
  server in Dev and Test environments.

ucberkeley_envconf 7.x-2.0
--------------------------
* OPENUCB-768: Use production ldap (ldap.berkeley.edu) in dev and test
  environments.

ucberkeley_envconf 7.x-2.0-alpha1
---------------------------------
* Re-namespace module to be consistent with ucberkeley_cas
* Fix form_alter so it works with with 0.x or 1.x versions of cas_attributes

ucb_envconf 7.x-1.1-beta2
-------------------------
* Fix problems in the .info file
    * add project name
    * fix dependancies
* add the manifest for apps

ucb_envconf 7.x-1.1-beta1
-------------------------
* use hook_boot, so we make sure variables are set even on cached pages
* set variable values in $conf global to avoid calls to variable_set()
* forgo checking for associated modules to avoid extra processing
* update README

ucb_envconf 7.x-1.0
-------------------
* use hook_init()
* use variable_set to set variables
* use module_exists() to check for modules assoicated with variables

