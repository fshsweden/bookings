class AutoCreateController < ApplicationController

  before_action :authenticate_user!

  def index
    # present auto-create screen

    # some statistics
    ## @bookings = BookingItem.where(:week => params[:week]).order(:date_str, :from)
    @weekdata = BookingItem.where(:week => 1..5).group(:week).count
    ## {1=>49, 2=>49}
    
  end

  def create
    if params[:week].blank?
      @errors = Array.new
      puts params
      @errors << "No blank stuff!"
      puts "NO BLANK STUFF PLEASE!"
    else
      for indx in 0..6
        date = dt_of_week(indx, params[:week].to_i)

        create_booking_item date,
                            params[:week].to_i,
                            "08:00","10:00",
                            "ISVÅRD",
                            "VHC",
                            "Kommun"

        create_booking_item date,
                            params[:week].to_i,
                            "10:00","12:00",
                            "TRÄNING",
                            "SOFIEDALSSKOLAN",
                            "Kommun"
        create_booking_item date,
                            params[:week].to_i,
                            "16:00","17:00",
                            "TRÄNING",
                            "U13",
                            "Kommun"
        create_booking_item date,
                            params[:week].to_i,
                            "17:10","18:10",
                            "TRÄNING",
                            "A",
                            "Kommun"
        create_booking_item date,
                            params[:week].to_i,
                            "18:20","19:20",
                            "TRÄNING",
                            "U15",
                            "Kommun"
        create_booking_item date,
                            params[:week].to_i,
                            "19:30","20:30",
                            "TRÄNING",
                            "U16",
                            "Kommun"
        create_booking_item date,
                            params[:week].to_i,
                            "20:40","21:40",
                            "TRÄNING",
                            "J18",
                            "Kommun"

      end
    end

    render "index" #redirect_to will erase @errors...  USE session[:errors] !
  end

  #
  # copy weeks
  #
  def copy

    # create week x to y using template T
    if params[:source].blank? || params[:target].blank?
      @errors = Array.new
      puts params
      @errors << "No blank stuff!"
      puts "NO BLANK STUFF PLEASE!"
    else

      source_week = params[:source]
      target_week = params[:target]

      source_start_date = get_start_date_of_week(2017,source_week.to_i)
      target_start_date = get_start_date_of_week(2017,target_week.to_i)

      offset_in_days = calc_day_diff(source_start_date, target_start_date)

      # delete all items in Week Y



      # copy all items from week X to week Y

      #for all days in week (0..6)
      #  calculate new date in week Y using offset
      @source_items = BookingItem.where(:week => source_week)

      @source_items.each do |item|
        puts "Duplicating source item......"
        idup = item.dup
        idup.date_str = new_date_with_offset(item.date_str.to_date, offset_in_days)
        idup.save!
      end
    end

    render "index" #redirect_to will erase @errors...  USE session[:errors] !
  end

  private

  def new_date_with_offset(dt, offset)
    dt + offset.days
  end

  # Date or String
  #
  #
  def calc_day_diff(s,t)
    (t.to_date - s.to_date).to_i
  end

  def get_start_date_of_week(y, w)
    Date.commercial(y, w, 1)
  end

  #
  # "2017-01-01" format from Date
  #
  def date_to_str(dt)
    dt.strftime("%Y-%m-%d")
  end

  #
  # DateTime from WeekNumber + index
  #
  #
  def dt_of_week(index, week_num)
    dt = get_start_date_of_week(2017, week_num)
    dt + index.days
  end

  # tmpl is an array of 7 template booking items
  #
  #
  def save_as_week(tmpl, year, week)

    if tmpl.length != 7
      puts "ERROR missing template items! Must be exactly 7"
      return
    end

    wkBegin = Date.commercial(year, week, 1)
    wkEnd = Date.commercial(year, week, 7)

    index=0
    for d in wkBegin..wkEnd do
      tmpl_day = tmpl[index]
      BookingItem.create(tmpl_day)
      index = index + 1
    end
  end

  def create_booking_item (dt, week, from, to, act, team, zamboni)
    BookingItem.create!({ date_str: dt,
                          week: week,
                          from: from,
                          to: to,
                          activity: act,
                          team: team,
                          note: "",
                          zamboni: zamboni,
                          comment: ""});
  end
end
