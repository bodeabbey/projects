[app_public_ips]
%{ for ip in app_public_ips ~}
${ip} 
%{ endfor ~}

[app_private_ips]
%{ for ip in app_private_ips ~}
${ip} 
%{ endfor ~}

[lb_public_ips]
%{ for ip in lb_public_ips ~}
${ip}
%{ endfor ~}
