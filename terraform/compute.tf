resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaaxyc232e2lwbw377m7vrpqpiniffrzdwpe4e3jgbfu3usgaovhvjq"
    shape = "VM.Standard.E2.1.Micro"
    source_details {
        source_id = "ocid1.image.oc1.eu-zurich-1.aaaaaaaaeforudw2d4ac7njkpmw2nghwe4mee23eakgw3uecr2vhb4trnzcq"
        source_type = "image"
    }

    # Optional
    count = 2
    display_name = "ubuntu-instance-${count.index}" 
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "ocid1.subnet.oc1.eu-zurich-1.aaaaaaaapfecrn4cnr4urrxpxjtd53x2j435rx2ybu34ee2pcfr2srmc6u3a"
    }
    metadata = {
        ssh_authorized_keys = file("/Users/serg/.ssh/serg_oracle_matrix.pub")
    } 
    preserve_boot_volume = false
}