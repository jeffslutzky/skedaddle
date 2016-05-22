class CharactersController < ApplicationController

  def index

  end

end

# <div>
# <h4>(1) Hash of Character Data</h4>
# <p>
#   <%= Character.charactersHash %>
# </p>
# </div>
#
# <hr>
#
# <div>
# <h4>(2) Characters Sorted by Popularity</h4>
#
#   <div class="panel panel-default">
#     <div class="panel-heading">By comics</div>
#     <table class="table">
#       <thead>
#         <tr>
#           <th>#</th>
#           <th>Character</th>
#           <th>Number of comics</th>
#         </tr>
#       </thead>
#       <tbody>
#         <% i = 0 %>
#         <% Character.sortByValue(:comics).each do |name, data| %>
#           <% i+=1 %>
#           <tr>
#             <td><%= i %></td>
#             <td>
#               <%= name.split.map(&:capitalize).join(' ').split('-').map(&:titleize).join('-') %>
#               <br />
#               <img src="<%= data["imageURL"] %>">
#             </td>
#             <td><%= data["value"] %></td>
#           </tr>
#         <% end %>
#       </tbody>
#    </table>
#   </div>
#
#   <div class="panel panel-default">
#     <div class="panel-heading">By series</div>
#     <table class="table">
#       <thead>
#         <tr>
#           <th>#</th>
#           <th>Character</th>
#           <th>Number of series</th>
#         </tr>
#       </thead>
#       <tbody>
#         <% i = 0 %>
#         <% Character.sortByValue(:series).each do |name, data| %>
#           <% i+=1 %>
#           <tr>
#             <td><%= i %></td>
#             <td>
#               <%= name.split.map(&:capitalize).join(' ').split('-').map(&:titleize).join('-') %>
#               <br />
#               <img src="<%= data["imageURL"] %>">
#             </td>
#             <td><%= data["value"] %></td>
#           </tr>
#         <% end %>
#       </tbody>
#    </table>
#   </div>
#
#   <div class="panel panel-default">
#     <div class="panel-heading">By stories</div>
#     <table class="table">
#       <thead>
#         <tr>
#           <th>#</th>
#           <th>Character</th>
#           <th>Number of stories</th>
#         </tr>
#       </thead>
#       <tbody>
#         <% i = 0 %>
#         <% Character.sortByValue(:stories).each do |name, data| %>
#           <% i+=1 %>
#           <tr>
#             <td><%= i %></td>
#             <td>
#               <%= name.split.map(&:capitalize).join(' ').split('-').map(&:titleize).join('-') %>
#               <br />
#               <img src="<%= data["imageURL"] %>">
#             </td>
#             <td><%= data["value"] %></td>
#           </tr>
#         <% end %>
#       </tbody>
#    </table>
#   </div>
#
# </div>
#
# <hr>
#
# <div>
# <h4>(3) Events in common</h4>
#
# <ul class="list-group">
#   <% Character.commonEvents.each do |event| %>
#     <li class="list-group-item"><%= event %></li>
#   <% end %>
# </ul>
# </div>
