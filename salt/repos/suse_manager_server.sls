{% if grains.get('role') == 'suse_manager_server' %}

{% if '3.0' in grains['product_version'] %}
suse_manager_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SUSE-Manager-Server/3.0/x86_64/product/
    - priority: 97

suse_manager_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SUSE-Manager-Server/3.0/x86_64/update/
    - priority: 97
{% endif %}

{% if '3.1' in grains['product_version'] %}
suse_manager_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SUSE-Manager-Server/3.1/x86_64/product
    - priority: 97

suse_manager_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SUSE-Manager-Server/3.1/x86_64/update/
    - priority: 97
{% endif %}

{% if '3.2' in grains['product_version'] %}
suse_manager_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SUSE-Manager-Server/3.2/x86_64/product
    - priority: 97

suse_manager_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SUSE-Manager-Server/3.2/x86_64/update/
    - priority: 97
{% endif %}

{% if 'uyuni-released' in grains['product_version'] %}
suse_manager_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/Uyuni:/Stable/images/repo/Uyuni-Server-4.0-POOL-x86_64-Media1/
    - priority: 97
{% endif %}

{% if 'head' in grains['product_version'] %}

{% if grains['osfullname'] == 'Leap' %}
suse_manager_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/Uyuni:/Master/images-openSUSE_Leap_42.3/repo/Uyuni-Server-4.0-POOL-x86_64-Media1/
    - priority: 97
{% else %}
suse_manager_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head/images/repo/SLE-Module-SUSE-Manager-Server-4.0-POOL-x86_64-Media1/
    - priority: 97
{% endif %}

{% if grains['osfullname'] == 'Leap' %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/Uyuni:/Master/openSUSE_Leap_42.3/
    - priority: 96
{% else %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head/SLE_15_SP1/
    - priority: 96
{% endif %}

{% if grains['osfullname'] != 'Leap' %}
module_server_applications_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Server-Applications/15-SP1/x86_64/product/

module_server_applications_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Server-Applications/15-SP1/x86_64/update/

module_web_scripting_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Web-Scripting/15-SP1/x86_64/product/

module_web_scripting_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Web-Scripting/15-SP1/x86_64/update/

module_python2_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Python2/15-SP1/x86_64/product/
{% endif %}
{% endif %}

{% if '3.0-nightly' in grains['product_version'] %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/3.0/SLE_12_SP1_Update/
    - priority: 96
{% endif %}

{% if '3.1-nightly' in grains['product_version'] %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/3.1/SLE_12_SP2/
    - priority: 96
{% endif %}

{% if '3.2-nightly' in grains['product_version'] %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/3.2/SLE_12_SP3/
    - priority: 96
{% endif %}

{% if 'test' in grains['product_version'] %}
{% if grains['osfullname'] == 'Leap' %}
suse_manager_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/Uyuni:/Master/images-openSUSE_Leap_42.3/repo/Uyuni-Server-4.0-POOL-x86_64-Media1/
    - priority: 97
{% else %}
suse_manager_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head/images/repo/SLE-Module-SUSE-Manager-Server-4.0-POOL-x86_64-Media1/
    - priority: 97
{% endif %}

{% if grains['osfullname'] == 'Leap' %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/Uyuni:/Master/openSUSE_Leap_42.3/
    - priority: 96
{% else %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head/SLE_15_SP1/
    - priority: 96
{% endif %}

suse_manager_test_repo:
  pkgrepo.managed:
    {% if grains.get("product_test_repository") %}
    - baseurl: {{ grains.get("product_test_repository") }}
    {% else %}
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/TEST/SLE_15_SP1/
    {% endif %}
    - priority: 95

{% if grains['osfullname'] != 'Leap' %}
module_server_applications_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Server-Applications/15-SP1/x86_64/product/

module_server_applications_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Server-Applications/15-SP1/x86_64/update/

module_web_scripting_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Web-Scripting/15-SP1/x86_64/product/

module_web_scripting_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Web-Scripting/15-SP1/x86_64/update/

module_python2_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Python2/15-SP1/x86_64/product/
{% endif %}
{% endif %}

{% if grains.get('log_server') | default(false, true) %}
filebeat_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/security:/logging/SLE_12_SP4/
{% endif %}

{% if grains.get('monitored') | default(false, true) %}
prometheus_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/sumaform:/tools/{{path}}/
    - gpgcheck: 1
    - gpgkey: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/sumaform:/tools/{{path}}/repodata/repomd.xml.key
{% endif %}

{% endif %}

{% if grains.get('pts') and grains['os'] == 'SUSE' %}
tools_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/sumaform:/tools/{{path}}/
    - gpgcheck: 1
    - gpgkey: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/sumaform:/tools/{{path}}/repodata/repomd.xml.key
{% endif %}

# HACK: work around #10852
{{ sls }}_nop:
  test.nop: []
