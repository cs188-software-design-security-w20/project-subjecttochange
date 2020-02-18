class PatientsController < ApplicationController
  before_action :authenticate_patient!
  def index
  end

  def show
  end

  def new
  end

  def calendar
    d = Date.today
    @date= d.at_beginning_of_week
    dstart = d.at_beginning_of_week.strftime("%d")
    mstart = d.at_beginning_of_week.strftime("%B")
    dend = d.at_end_of_week.strftime("%d")

    mend = d.at_end_of_week.strftime("%B")
    if mstart != mend
        @label = "Week of " + mstart.to_s + " " + dstart.to_s + " - " + mend.to_s + " " + dend.to_s
    else
        @label = "Week of " + mstart.to_s + " " + dstart.to_s + " - "  + dend.to_s
    end
    week = d.all_week
    week = week.step(1).to_a
    @mon = week[0].strftime("%d")
    @tues = week[1].strftime("%d")
    @wed = week[2].strftime("%d")
    @thur = week[3].strftime("%d")
    @fri = week[4].strftime("%d")
    @sat = week[5].strftime("%d")
    @sun = week[6].strftime("%d")

    @activeMon = ""
    @activeTue = ""
    @activeWed = ""
    @activeThur = ""
    @activeFri = ""
    @activeSat = ""
    @activeSun = ""


    if week[0] == d
        @activeMon = "active"
    elsif week[1] == d
        @activeTue = "active"
    elsif week[2] == d
        @activeWed = "active"
    elsif week[3] == d
        @activeThur = "active"
    elsif week[4] == d
        @activeFri = "active"
    elsif week[5] == d
        @activeSat = "active"
    elsif week[6] == d
        @activeSun = "active"
    end
  end


end
