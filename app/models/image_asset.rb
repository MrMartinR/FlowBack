class ImageAsset < ApplicationRecord
  self.implicit_order_column = "created_at"

  IMAGEASSET_CATEGORY =  ["FLAG", "ADMIN_ACCOUNT", "USER_ACCOUNT",
                    "CURRENCY", "ORIGINATORS", "ORGANIZATION",
                    "PLATFORM"]

  scope :by_category, -> (text_category) { where("category = ?", text_category.upcase) if text_category.present?}
  scope :by_uid, -> (text_uid) { where("uid = ?", text_uid) if text_uid.present?}

  before_validation { self.category = self.category.upcase }
  validates :category, :inclusion=> { :in => IMAGEASSET_CATEGORY }
  #before_save :check_category


  def check_category

    # if not on the list of category, return error
     p "a1"
    if !IMAGEASSET_CATEGORY.include?(self.category.upcase)
      p "a"
      errors.add(:category, "Category did not Match !")
    end
  end

  def self.add_sample_flag
    uid_c = Country.order('random()').first.id
    self.create(category: IMAGEASSET_CATEGORY.sample,uid: uid_c, logo: '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->
<svg
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:cc="http://creativecommons.org/ns#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns:svg="http://www.w3.org/2000/svg"
    xmlns:ns1="http://sozi.baierouge.fr"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    id="svg3176"
    sodipodi:docname="American_Flag.pdf"
    viewBox="0 0 600 316"
    version="1.1"
    inkscape:version="0.47 r22583"
  >
  <sodipodi:namedview
      id="namedview3178"
      bordercolor="#666666"
      inkscape:pageshadow="2"
      guidetolerance="10"
      pagecolor="#ffffff"
      gridtolerance="10"
      inkscape:window-maximized="0"
      inkscape:zoom="2.0886076"
      objecttolerance="10"
      borderopacity="1"
      inkscape:current-layer="svg3176"
      inkscape:cx="244.84472"
      inkscape:guide-bbox="true"
      inkscape:cy="158"
      inkscape:window-y="0"
      inkscape:window-x="0"
      inkscape:window-width="1657"
      showgrid="false"
      inkscape:pageopacity="0"
      inkscape:window-height="915"
      showguides="true"
  />
  <path
      id="path3188"
      style="fill:#000000"
      d="m0.90888 304.15v-12h300 300v12 12h-300-300v-12zm0-49v-12h300 300v12 12h-300-300v-12zm0-48.5v-11.5h300 300v11.5 11.5h-300-300v-11.5zm0-121.5v-85h300 300v12 12h-180-180v12.5 12.5h180 180v12 12h-180-180v12.5 12.5h180 180v11.5 11.5h-180-180v12.5 12.5h180 180v12 12h-300-300v-85zm18.25 73.19c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.775-0.005c-3.3929-0.004-3.8357-0.30858-4.375-3.0049-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53927 2.6964-0.98209 3.0005-4.375 3.005l-3.775 0.005 2.9068 2.3259c2.6847 2.1482 2.8215 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.775-0.005c-3.3929-0.004-3.8357-0.30858-4.375-3.0049-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53927 2.6964-0.98209 3.0005-4.375 3.005l-3.775 0.005 2.9068 2.3259c2.6847 2.1482 2.8215 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.9429-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.775-0.005c-3.3929-0.004-3.8357-0.30862-4.375-3.005-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53927 2.6964-0.98209 3.0005-4.375 3.005l-3.775 0.005 2.9068 2.3259c2.6847 2.1482 2.8215 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.775-0.005c-3.3929-0.004-3.8357-0.30862-4.375-3.005-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53927 2.6964-0.98209 3.0005-4.375 3.005l-3.775 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.775-0.005c-3.3929-0.004-3.8357-0.30862-4.375-3.005-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53927 2.6964-0.98209 3.0005-4.375 3.005l-3.775 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.775-0.005c-3.3929-0.004-3.8357-0.30862-4.375-3.005-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53927 2.6964-0.98209 3.0005-4.375 3.005l-3.775 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm-180-17c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33745-4.3295-3.0049-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3294 3.005l-3.6706 0.005 2.9068 2.3259c2.6847 2.1482 2.8215 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33745-4.3295-3.0049-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3294 3.005l-3.6706 0.005 2.9068 2.3259c2.6847 2.1482 2.8215 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33749-4.3295-3.005-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3295 3.005l-3.6705 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33749-4.3295-3.005-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3295 3.005l-3.6705 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33749-4.3295-3.005-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3295 3.005l-3.6705 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm-180-17c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33745-4.3295-3.0049-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3294 3.005l-3.6706 0.005 2.9068 2.3259c2.6847 2.1482 2.8215 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6204 3.1092 4.1766 3.0348 3.168-0.42362-0.85494-2.9315-0.66749-3.5012 1.8143-5.5143l2.7677-2.245-3.6705-0.005c-3.2637-0.004-3.7436-0.33745-4.3295-3.0049-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3294 3.005l-3.6706 0.005 2.9068 2.3259c2.6847 2.1482 2.8215 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.9429-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33749-4.3295-3.005-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3294 3.005l-3.6706 0.005 2.7677 2.245c2.4818 2.0131 2.6692 2.5828 1.8143 5.5143-1.0086 3.4584-0.45239 3.5328 3.168 0.42362zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6204 3.1092 4.1766 3.0348 3.168-0.42362-0.85494-2.9315-0.66749-3.5012 1.8143-5.5143l2.7677-2.245-3.6705-0.005c-3.2637-0.004-3.7436-0.33749-4.3295-3.005-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3295 3.005l-3.6705 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33749-4.3295-3.005-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3295 3.005l-3.6705 0.005 2.7677 2.245c2.4818 2.0131 2.6692 2.5828 1.8143 5.5143-1.0086 3.4584-0.45238 3.5328 3.168 0.42362zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33749-4.3295-3.005-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3295 3.005l-3.6705 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm-180-17c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33745-4.3295-3.0049-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3294 3.005l-3.6706 0.005 2.9068 2.3259c2.6847 2.1482 2.8215 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm80 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33745-4.3295-3.0049-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3295 3.005l-3.6705 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm80 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6603 3.1435 4.2415 3.0811 3.0531-0.32779-1.0314-2.9586-0.89459-3.3811 1.7901-5.5293l2.9068-2.3259-3.6705-0.005c-3.2637-0.004-3.7436-0.33745-4.3295-3.0049-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58588 2.6675-1.0658 3.0006-4.3295 3.005l-3.6705 0.005 2.9068 2.3259c2.6847 2.1482 2.8214 2.5707 1.7901 5.5293-1.1883 3.4089-0.6072 3.4712 3.0531 0.32779zm-120.08 0.1521c1.7017-1.54 1.9558-1.54 3.6575 0 2.646 2.3946 3.4159 2.0455 2.698-1.2232-0.5224-2.3785-0.14557-3.2411 2.1706-4.9683l2.8027-2.0901-3.6705-0.0317c-3.2552-0.0281-3.7451-0.3712-4.3295-3.0317-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58434 2.6605-1.0743 3.0036-4.3294 3.0317l-3.6706 0.0317 2.8027 2.0901c2.3161 1.7272 2.693 2.5898 2.1705 4.9683-0.71792 3.2687 0.0521 3.6178 2.698 1.2232zm80 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.646 2.3946 3.4159 2.0455 2.698-1.2232-0.52241-2.3785-0.14557-3.2411 2.1706-4.9683l2.8027-2.0901-3.6705-0.0317c-3.2552-0.0281-3.7451-0.3712-4.3295-3.0317-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58434 2.6605-1.0743 3.0036-4.3295 3.0317l-3.6705 0.0317 2.8027 2.0901c2.3161 1.7272 2.693 2.5898 2.1706 4.9683-0.71792 3.2687 0.052 3.6178 2.698 1.2232zm-140-16.999c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58143 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58143 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58143 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58144 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58144 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.3624-1.65-1.0374-3-1.5-3s-1.1376 1.35-1.5 3c-0.58144 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm-179.92-17.152c1.557-1.3372 1.943-1.3372 3.5 0 3.6599 3.1431 4.2414 3.081 3.0538-0.32597-1.018-2.9203-0.87782-3.4065 1.5958-5.5342l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0857 3-4.1352 3h-3.4763l2.7119 2.3327c2.4737 2.1278 2.6139 2.6139 1.5958 5.5342-1.1877 3.407-0.60609 3.469 3.0538 0.32597zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6599 3.1431 4.2414 3.081 3.0538-0.32597-1.018-2.9203-0.87782-3.4065 1.5958-5.5342l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0857 3-4.1352 3h-3.4763l2.7119 2.3327c2.4737 2.1278 2.6139 2.6139 1.5958 5.5342-1.1877 3.407-0.60609 3.469 3.0538 0.32597zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6599 3.1431 4.2414 3.081 3.0538-0.32597-1.018-2.9203-0.87783-3.4065 1.5958-5.5342l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0858 3-4.1352 3h-3.4763l2.7119 2.3327c2.4737 2.1278 2.6139 2.6139 1.5958 5.5342-1.1877 3.407-0.6061 3.469 3.0538 0.32597zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6599 3.1431 4.2414 3.081 3.0538-0.32597-1.018-2.9203-0.87783-3.4065 1.5958-5.5342l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0858 3-4.1352 3h-3.4763l2.7119 2.3327c2.4737 2.1278 2.6139 2.6139 1.5958 5.5342-1.1877 3.407-0.6061 3.469 3.0538 0.32597zm40 0c1.557-1.3372 1.943-1.3372 3.5 0 3.6599 3.1431 4.2414 3.081 3.0538-0.32597-1.018-2.9203-0.87783-3.4065 1.5958-5.5342l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0858 3-4.1352 3h-3.4763l2.7119 2.3327c2.4737 2.1278 2.6139 2.6139 1.5958 5.5342-1.1877 3.407-0.6061 3.469 3.0538 0.32597zm-175.29-16.22 2.9624 2.1094-1.1185-3.2086c-1.021-2.9288-0.88206-3.412 1.5934-5.5413l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0857 3-4.1352 3h-3.4763l2.7119 2.3327c2.4754 2.1293 2.6144 2.6125 1.5934 5.5413l-1.1185 3.2086 2.9624-2.1094 2.9624-2.1094 2.9624 2.1094zm40 0 2.9624 2.1094-1.1185-3.2086c-1.021-2.9288-0.88206-3.412 1.5934-5.5413l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0857 3-4.1352 3h-3.4763l2.7119 2.3327c2.4754 2.1293 2.6144 2.6125 1.5934 5.5413l-1.1185 3.2086 2.9624-2.1094 2.9624-2.1094 2.9624 2.1094zm40 0 2.9624 2.1094-1.1185-3.2086c-1.021-2.9288-0.88206-3.412 1.5934-5.5413l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0857 3-4.1352 3h-3.4763l2.7119 2.3327c2.4754 2.1293 2.6144 2.6125 1.5934 5.5413l-1.1185 3.2086 2.9624-2.1094 2.9624-2.1094 2.9624 2.1094zm40 0 2.9624 2.1094-1.1185-3.2086c-1.021-2.9288-0.88206-3.412 1.5934-5.5413l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0858 3-4.1352 3h-3.4763l2.7119 2.3327c2.4754 2.1293 2.6144 2.6125 1.5934 5.5413l-1.1185 3.2086 2.9624-2.1094 2.9624-2.1094 2.9624 2.1094zm40 0 2.9624 2.1094-1.1185-3.2086c-1.021-2.9288-0.88206-3.412 1.5934-5.5413l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0858 3-4.1352 3h-3.4763l2.7119 2.3327c2.4754 2.1293 2.6144 2.6125 1.5934 5.5413l-1.1185 3.2086 2.9624-2.1094 2.9624-2.1094 2.9624 2.1094zm40 0 2.9624 2.1094-1.1185-3.2086c-1.021-2.9288-0.88206-3.412 1.5934-5.5413l2.7119-2.3327h-3.4763c-3.0495 0-3.5572-0.36836-4.1352-3-0.84272-3.8369-2.1573-3.8369-3 0-0.57801 2.6316-1.0858 3-4.1352 3h-3.4763l2.7119 2.3327c2.4754 2.1293 2.6144 2.6125 1.5934 5.5413l-1.1185 3.2086 2.9624-2.1094 2.9624-2.1094 2.9624 2.1094zm-184.79-17.628c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.6599c-3.2665 0-3.7243-0.32243-4.2599-3-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53551 2.6776-0.99335 3-4.2599 3h-3.6599l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.6599c-3.2665 0-3.7243-0.32243-4.2599-3-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53551 2.6776-0.99335 3-4.2599 3h-3.6599l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.6599c-3.2665 0-3.7244-0.32243-4.2599-3-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53551 2.6776-0.99335 3-4.2599 3h-3.6599l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.6599c-3.2665 0-3.7244-0.32243-4.2599-3-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53551 2.6776-0.99335 3-4.2599 3h-3.6599l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm40 0c1.7017-1.54 1.9558-1.54 3.6575 0 2.6472 2.3957 3.4159 2.0452 2.6966-1.2298-0.51723-2.3549-0.13968-3.2734 2.0554-5l2.689-2.1152h-3.6599c-3.2665 0-3.7244-0.32243-4.2599-3-0.33-1.65-0.9375-3-1.35-3s-1.02 1.35-1.35 3c-0.53551 2.6776-0.99335 3-4.2599 3h-3.6599l2.689 2.1152c2.1951 1.7266 2.5726 2.6451 2.0554 5-0.71931 3.275 0.0493 3.6256 2.6966 1.2298zm-175.55-16.673 2.6223 1.7182-0.67648-3.08c-0.5673-2.5829-0.24252-3.4213 2.0125-5.1952l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.84272-3.8369-2.1573-3.8369-3 0-0.58143 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.2551 1.7738 2.5798 2.6122 2.0125 5.1952l-0.67648 3.08 2.6223-1.7182c2.479-1.6243 2.7657-1.6243 5.2446 0zm40 0 2.6223 1.7182-0.67648-3.08c-0.5673-2.5829-0.24252-3.4213 2.0125-5.1952l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.84272-3.8369-2.1573-3.8369-3 0-0.58143 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.2551 1.7738 2.5798 2.6122 2.0125 5.1952l-0.67648 3.08 2.6223-1.7182c2.479-1.6243 2.7657-1.6243 5.2446 0zm40 0 2.6223 1.7182-0.67648-3.08c-0.56731-2.5829-0.24252-3.4213 2.0125-5.1952l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.84272-3.8369-2.1573-3.8369-3 0-0.58143 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.2551 1.7738 2.5798 2.6122 2.0125 5.1952l-0.67648 3.08 2.6223-1.7182c2.479-1.6243 2.7657-1.6243 5.2446 0zm40 0 2.6223 1.7182-0.67648-3.08c-0.56731-2.5829-0.24252-3.4213 2.0125-5.1952l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.84272-3.8369-2.1573-3.8369-3 0-0.58144 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.2551 1.7738 2.5798 2.6122 2.0125 5.1952l-0.67648 3.08 2.6223-1.7182c2.479-1.6243 2.7657-1.6243 5.2446 0zm40 0 2.6223 1.7182-0.67648-3.08c-0.56731-2.5829-0.24252-3.4213 2.0125-5.1952l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.84272-3.8369-2.1573-3.8369-3 0-0.58144 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.2551 1.7738 2.5798 2.6122 2.0125 5.1952l-0.67648 3.08 2.6223-1.7182c2.479-1.6243 2.7657-1.6243 5.2446 0zm40 0 2.6223 1.7182-0.67648-3.08c-0.56731-2.5829-0.24252-3.4213 2.0125-5.1952l2.689-2.1152h-3.5554c-3.1374 0-3.6329-0.35275-4.2143-3-0.84272-3.8369-2.1573-3.8369-3 0-0.58144 2.6472-1.077 3-4.2143 3h-3.5554l2.689 2.1152c2.2551 1.7738 2.5798 2.6122 2.0125 5.1952l-0.67648 3.08 2.6223-1.7182c2.479-1.6243 2.7657-1.6243 5.2446 0z"
  />
  <metadata
    >
    <rdf:RDF
      >
      <cc:Work
        >
        <dc:format
          >image/svg+xml</dc:format
        >
        <dc:type
            rdf:resource="http://purl.org/dc/dcmitype/StillImage"
        />
        <cc:license
            rdf:resource="http://creativecommons.org/licenses/publicdomain/"
        />
        <dc:publisher
          >
          <cc:Agent
              rdf:about="http://openclipart.org/"
            >
            <dc:title
              >Openclipart</dc:title
            >
          </cc:Agent
          >
        </dc:publisher
        >
        <dc:title
          >American Flag</dc:title
        >
        <dc:date
          >2010-07-18T02:23:14</dc:date
        >
        <dc:description
        />
        <dc:source
          >https://openclipart.org/detail/73663/american-flag-by-azzhurtz</dc:source
        >
        <dc:creator
          >
          <cc:Agent
            >
            <dc:title
              >Azzhurtz</dc:title
            >
          </cc:Agent
          >
        </dc:creator
        >
        <dc:subject
          >
          <rdf:Bag
            >
            <rdf:li
              >American flag</rdf:li
            >
            <rdf:li
              >flag</rdf:li
            >
            <rdf:li
              >flags</rdf:li
            >
            <rdf:li
              >usa</rdf:li
            >
            <rdf:li
              >vector</rdf:li
            >
          </rdf:Bag
          >
        </dc:subject
        >
      </cc:Work
      >
      <cc:License
          rdf:about="http://creativecommons.org/licenses/publicdomain/"
        >
        <cc:permits
            rdf:resource="http://creativecommons.org/ns#Reproduction"
        />
        <cc:permits
            rdf:resource="http://creativecommons.org/ns#Distribution"
        />
        <cc:permits
            rdf:resource="http://creativecommons.org/ns#DerivativeWorks"
        />
      </cc:License
      >
    </rdf:RDF
    >
  </metadata
  >
</svg
>
' , icn: 'a')
  end
end
