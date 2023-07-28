module ApplicationHelper
  def pretty_date(date)
    now = Time.zone.now
    case
    when date.today?
      "Aujourd'hui à #{date.strftime('%Hh%M')}"
    when date.to_date == now.yesterday.to_date
      "Hier à #{date.strftime('%Hh%M')}"
    when date.to_date == now.yesterday.yesterday.to_date
      "Avant-hier à #{date.strftime('%Hh%M')}"
    else
      date.strftime('%d %b à %Hh%M')
    end
  end
end
